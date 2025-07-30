contract B(x: Int) {
    receive() {}
}

contract Test {
    receive() {
        let initB = initOf B(123);
        let codeB = codeOf B;
    }
}
