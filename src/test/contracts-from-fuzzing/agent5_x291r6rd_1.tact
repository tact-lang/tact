contract Child {
    init() {}
}

contract Parent {
    init() {
       let childInit = initOf Child();
       let childAddr = contractAddress(childInit);
    }
}
