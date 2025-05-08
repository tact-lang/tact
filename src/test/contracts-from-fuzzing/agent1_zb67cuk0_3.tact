contract GrandChild {
    init() {}
    receive() {}
}

contract Child {
    init() {
        // Nested initialization: compute the init package of GrandChild
        let sGC: StateInit = initOf GrandChild();
    }
    receive() {}
}

contract Parent {
    receive() {
        // Obtain the initial state package for Child
        let sChild: StateInit = initOf Child();
        // Compute its address using two different methods
        let addr1: Address = contractAddress(sChild);
        let addr2: Address = contractAddressExt(0, codeOf Child, sChild.data);
        // Verify that the addresses match using a string message for require
        require(addr1 == addr2, "Mismatch");
        // Reply with confirmation
        self.reply("Nested OK".asComment());
    }
}
