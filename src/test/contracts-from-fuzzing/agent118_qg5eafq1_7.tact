contract B(param: Int) {
    receive() {}
}

contract Test {
    receive() {
        let initB = initOf B(456);
        let codeB = codeOf B;
    }
}
