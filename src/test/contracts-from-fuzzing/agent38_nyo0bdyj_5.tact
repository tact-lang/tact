contract E {
    init(val: Int) { }
}

contract D {
    init(val: Int) {
        let eState = initOf E(val + 1);
    }
}

contract C {
    init(val: Int) {
        let dState = initOf D(val + 1);
    }
}

contract B {
    init(val: Int) {
        let cState = initOf C(val + 1);
    }
}

contract A {
    init(val: Int) {
        let bState = initOf B(val + 1);
        let addrB = contractAddress(bState);
    }
}
