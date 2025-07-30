contract B(param: Int) {
    receive() {}
}

contract Test2 {
    receive() {
        let codeB = codeOf B;
        let initB = initOf B(123);
    }
}
