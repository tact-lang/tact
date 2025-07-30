/// Test Case: Using codeOf for the current contract vs. myCode()
contract TestCurrent {
    receive() {
        // myCode() and codeOf for the current contract should be identical
        let eq: Bool = myCode() == codeOf TestCurrent;
    }
}

/// Test Case: Same contract parameters yield same code part in StateInit despite different init parameters
contract C(val: Int) {
    receive() {}
}

contract TestC1 {
    receive() {
        let s1: StateInit = initOf C(1);
        let s2: StateInit = initOf C(2);
        // The code part should be identical, while the data part may differ
        let eq: Bool = s1.code == s2.code;
    }
}
