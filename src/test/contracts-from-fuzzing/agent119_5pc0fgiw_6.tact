contract A {
    receive() {}
}

contract Test {
    receive() {
        let s = initOf A();
        s;
    }
}
