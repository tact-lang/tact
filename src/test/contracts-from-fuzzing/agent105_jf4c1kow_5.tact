contract A {
    receive () {}
}

contract Test {
    receive () {
         let c: Cell = codeOf A;
         let i: StateInit = initOf A();
    }
}
