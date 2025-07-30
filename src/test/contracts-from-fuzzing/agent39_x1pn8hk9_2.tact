contract GrandChild {
    init() {}
}

contract Child {
    init() {
        let s = initOf GrandChild();
    }
}

contract Parent {
    receive() {
        let s = initOf Child();
        let a = contractAddress(s);
    }
}
