<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $Article = $em->getRepository('AppBundle:Article')->findAll();
        $Section = $em->getRepository('AppBundle:Section')->findAll();

        return $this->render('default/index.html.twig', array(
           "Article"=>$Article,
           "Section"=>$Section  
       ));

        
    }
}
