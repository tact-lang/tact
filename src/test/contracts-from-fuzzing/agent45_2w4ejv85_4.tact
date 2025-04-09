contract A {
    receive() {}
}

contract Test {
    // Valid test: comparing contract A's init code extracted from initOf with codeOf A
    get fun validComparison(): Bool {
        // Both expressions should yield a Cell containing the same code
        return initOf A().code == codeOf A;
    }

    receive() {}
}
