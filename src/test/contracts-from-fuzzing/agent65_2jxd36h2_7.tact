contract A {
    receive() {}
}

contract Test {
    receive() {
       let s: StateInit = initOf A();
       let c: Cell = codeOf A;
       let addr: Address = contractAddress(s);
       addr;
       c;
    }
}
