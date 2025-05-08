contract A {
    init() { }
    receive() { }
}

contract Test {
    receive() {
         // Valid usage: using initOf with empty parameter list and codeOf on contract A
         let initState = initOf A();
         let codeCell = codeOf A;
    }
}
