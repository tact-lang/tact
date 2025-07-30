contract B(param: Int) {
    receive () {}
}

contract Test {
    receive () {
        let s: StateInit = initOf B(42);
        let c: Cell = codeOf B;
    }
}
