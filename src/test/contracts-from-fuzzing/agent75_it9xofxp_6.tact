contract TestExplicitInit {
    init() {
         // explicit initialization
    }
    receive() {}
}

contract ContainerExplicitInit {
    receive() {
         let initPkg = initOf TestExplicitInit();
         let code = codeOf TestExplicitInit;
    }
}
