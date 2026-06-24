contract Child {
    init() {}
}

contract Parent {
    // state variable to store child's address
    childAddr: Address;

    init() {
        let initChild = initOf Child();
        self.childAddr = contractAddress(initChild);
    }

    get fun getChildAddr(): Address {
        return self.childAddr;
    }
}
