contract A {
    init() {}
}

contract B {
    receive() {
        let s = initOf A();
    }
}
