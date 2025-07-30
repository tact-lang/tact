contract B {
    receive() {}
}

contract Test {
    receive() {
        let c: Cell = codeOf B;
    }
}
