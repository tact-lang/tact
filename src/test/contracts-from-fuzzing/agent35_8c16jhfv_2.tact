contract A {
    receive() {}
}

contract Test {
    receive() {
        let st = initOf A();
    }
}
