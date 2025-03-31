contract ContractC {
    init() {
        // Empty init
    }
}

contract ContractB {
    receive() {
        // Multi-level: ContractB initializes ContractC
        let sC = initOf ContractC();
        // Use the code and data fields to force evaluation
        let _ = sC.code;
        let __ = sC.data;
    }
}

contract ContractA {
    receive() {
        // Multi-level: ContractA initializes ContractB
        let sB = initOf ContractB();
        let _ = sB.code;
        let __ = sB.data;
    }
}
