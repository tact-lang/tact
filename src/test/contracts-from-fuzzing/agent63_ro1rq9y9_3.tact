contract A {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let s = initOf A();
        let c = codeOf A;
    }
}
