contract A {
    init(a: Int) {}
    receive() {}
}

contract Test1 {
    receive() {
        let initPkg: StateInit = initOf A(10);
        let c: Cell = codeOf A;
    }
}
