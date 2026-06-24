contract B(param: Int) {
    receive() {}
}

contract Test2 {
    receive() {
        let pkg = initOf B(123);
        let codeCell = codeOf B;
    }
}
