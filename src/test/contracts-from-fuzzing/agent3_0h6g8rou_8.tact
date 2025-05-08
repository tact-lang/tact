contract A {
    receive() {}
}

contract Test {
    receive() {
         codeOf A;
    }
}
