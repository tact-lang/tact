contract A {
    receive() {}
}

contract Test {
    receive() {
        // Valid usage: comparing myCode() with codeOf A; should be true
        let comparison: Bool = myCode() == codeOf A;
    }
}
