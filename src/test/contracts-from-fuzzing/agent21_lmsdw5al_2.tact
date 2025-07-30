contract GrandChild {
    init() {}
    receive() {}
}

contract Child {
    init() {}
    receive() {
         let s = initOf GrandChild();
         let addr = contractAddress(s);
    }
}

contract Parent {
    receive() {
         let s = initOf Child();
         let addr = contractAddress(s);
    }
}
