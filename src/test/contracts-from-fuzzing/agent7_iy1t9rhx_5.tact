contract A {
    receive() {}
}

contract Test {
    receive() {
         let state: StateInit = initOf A();
    }
}
