contract A {
    receive() {}
}

contract Test {
    receive() {
         let comparison: Bool = myCode() == codeOf A;
         // value of comparison is not used further
    }
}
