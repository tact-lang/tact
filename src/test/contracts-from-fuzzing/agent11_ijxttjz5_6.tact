contract C(x: Int) {
    receive() {}
}

contract Tester3 {
    receive() {
        // Using codeOf with a contract that has parameters; no parameter needed for codeOf
        let cc = codeOf C;
    }
}
