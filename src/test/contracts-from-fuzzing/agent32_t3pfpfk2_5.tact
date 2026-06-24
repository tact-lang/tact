contract ContractD {
    init(x: Int) {
        // Initialize ContractD with parameter x
    }
    receive() {}
}

contract ContractC {
    init(y: Int) {
        // Initialize ContractC and also initialize ContractD with y+1
        let s: StateInit = initOf ContractD(y + 1);
    }
    receive() {}
}

contract ContractB {
    init() {
        // ContractB initializes ContractC and ContractD
        let s1: StateInit = initOf ContractC(99);
        let s2: StateInit = initOf ContractD(42);
    }
    receive() {}
}

contract ContractA {
    init() {
        // ContractA initializes ContractB, ContractC and ContractD
        let s1: StateInit = initOf ContractB();
        let s2: StateInit = initOf ContractC(55);
        let s3: StateInit = initOf ContractD(77);
    }
    receive() {}
}
