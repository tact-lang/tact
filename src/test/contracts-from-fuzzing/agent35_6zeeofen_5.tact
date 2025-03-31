contract A {
    // No parameters
    receive() {
        // A calls initOf on B with parameter 100
        let bInit = initOf B(100);
        let addrB = contractAddress(bInit);
    }
}

contract B {
    init(x: Int) {
        // B initializes by calling initOf on C using x + 1
        let cInit = initOf C(x + 1);
        let addrC = contractAddress(cInit);
    }
}

contract C {
    init(y: Int) {
        // C initializes by retrieving A's code
        let aCode = codeOf A;
        // Use the parameter y in some arithmetic
        let z = y * 2;
    }
}
