contract A {
    receive() {}
}

contract TestInit {
    receive() {
         // Using parentheses to force correct parsing
         let s: StateInit = (initOf A());
    }
}
