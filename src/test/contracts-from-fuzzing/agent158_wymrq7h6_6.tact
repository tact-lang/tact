contract A {
    receive() {}
}

contract Test {
    receive() {
         let c = codeOf A;
    }
}
