contract A {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let si = initOf A();
    }
}