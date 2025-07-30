contract A {
    init(a: Int) { }
    receive() { }
}

contract TestValid {
    receive() {
        let s = initOf A(42);
        let c = codeOf A;
    }
}
