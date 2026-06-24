contract Child {
    init(val: Int) {
    }
}

contract Parent {
    init() {
       let childInit = initOf Child(10);
       let addr = contractAddress(childInit);
    }
}
