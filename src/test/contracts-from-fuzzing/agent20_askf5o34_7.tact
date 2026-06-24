contract ContractB {
    receive() {
        // Minimal receiver for ContractB
    }
}

contract ContractA {
    stateB: Cell;

    init() {
        // Obtain the initial state cell (data field) of ContractB's init package
        self.stateB = (initOf ContractB()).data;
    }

    receive() {
        // Minimal receiver for ContractA
    }
}
