contract A {
    receive() {}
}

contract Test {
    receive() {
        let pkg = initOf A();
        let codeCell = codeOf A;
    }
}
