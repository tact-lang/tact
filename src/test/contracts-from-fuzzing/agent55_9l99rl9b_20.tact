contract A {
    receive() {
        myCode() == codeOf A; // as per documentation example
    }
}

contract Test {
    receive() {
        let s: StateInit = initOf A();
    }
}
