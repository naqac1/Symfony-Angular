<?php

namespace App\Form;

use App\Entity\Orders;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('id')
            ->add('customer')
            ->add('address1')
            ->add('city')
            ->add('postcode')
            ->add('country')
            ->add('amount')
            ->add('status')
            ->add('deleted')
            ->add('date', DateType::class, array(
                'widget' => 'single_text',
                'html5' => false,
                'label' => 'Date (JJ/MM/AAAA)*',
                'format' => 'yyyy-MM-dd',
            ))
            ->add('lastModified',  DateType::class, array(
                'widget' => 'single_text',
                'html5' => false,
                'label' => 'Last modified',
                'format' => 'd-m-Y H:i',
            ))
            ->add('customers')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Orders::class,
            'csrf_protection' => false,
        ]);
    }
}
