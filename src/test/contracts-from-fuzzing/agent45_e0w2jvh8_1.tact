contract Child {
    init(x: Int) {
        // simple initialization
    }
}

contract Parent {
    receive() {
        let s = initOf Child(42);
        let addr = contractAddress(s);
    }
}
