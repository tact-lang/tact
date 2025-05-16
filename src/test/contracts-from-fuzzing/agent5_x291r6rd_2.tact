contract GrandChild {
    init() {}
}

contract Child {
    init() {
         let grandInit = initOf GrandChild();
         let grandAddr = contractAddress(grandInit);
    }
}

contract Parent {
    init() {
         let childInit = initOf Child();
         let childAddr = contractAddress(childInit);
    }
}
