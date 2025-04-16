contract D {
    init() {}
    receive() {
        // Test that codeOf of the current contract is equal to myCode()
        let flag: Bool = myCode() == codeOf D;
    }
}

contract TestD {
    receive() {
        // Also test initOf for contract D
        let s = initOf D();
        // Access code from the state package
        let c = s.code;
    }
}
