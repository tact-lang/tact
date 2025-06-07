contract A {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        // Valid usage of codeOf: Should compile successfully
        let code = codeOf A;
    }
}
