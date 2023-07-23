<?php

namespace App\Controller;

use App\Entity\Orders;
use App\Form\OrderType;
use App\Repository\OrdersRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Knp\Component\Pager\PaginatorInterface;


/**
 * @Route("/order")
 */
class OrderController extends AbstractController
{
    /**
     * @Route("/", name="order_index", methods={"GET"})
     */
    public function index(OrdersRepository $orderRepository, Request $request, PaginatorInterface $paginator): Response
    {
        $em = $this->getDoctrine()->getManager();

		$query = $orderRepository->findBy([],['date' => 'desc']);

        $orders = $paginator->paginate(
            $query, 
            $request->query->getInt('page', 1), 
            6 
        );

        return $this->render('order/index.html.twig', [
            'orders' => $orders,
        ]);
    }

        /**
     * * @Route("/search", name="order_search", methods={"POST"})
     */
    public function search(Request $request): Response
    { 
            $searchTerm=   $request->request->get('search');
             
             $em = $this->getDoctrine()->getManager();
             $results = $em->getRepository(Orders::class)->createQueryBuilder('o')->where('o.status LIKE :search')->orWhere('o.customer LIKE :search')->setParameter('search', $searchTerm)->getQuery()->getResult();
            
             return $this->render('order/search.html.twig', [
                'results' => $results,
                'val' => $searchTerm
 
    ]);
 
 /*    $response = new JsonResponse();
    $response->setData(array('list' => $content));
    return $response; */
    }

    /**
     * @Route("/new", name="order_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $order = new Orders();
        $form = $this->createForm(orderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($order);
            $entityManager->flush();

            return $this->redirectToRoute('order_index');
        }

        return $this->render('order/new.html.twig', [
            'order' => $order,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="order_show", methods={"GET"})
     */
    public function show(Orders $order): Response
    {
        return $this->render('order/show.html.twig', [
            'order' => $order,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="order_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Orders $order): Response
    {
        $form = $this->createForm(orderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('order_index');
        }

        return $this->render('order/edit.html.twig', [
            'order' => $order,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="order_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Orders $order): Response
    {
        if ($this->isCsrfTokenValid('delete'.$order->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($order);
            $entityManager->flush();
        }

        return $this->redirectToRoute('order_index');
    }
}
