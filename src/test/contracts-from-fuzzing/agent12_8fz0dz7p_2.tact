contract A {
    receive() {}
}

contract Tester {
    receive() {
        let s: StateInit = initOf A();
    }
}
