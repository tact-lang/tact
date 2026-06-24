contract Special(param: Int) {
    receive() {}
}

contract TestParam {
    receive() {
        let a = initOf Special(42);
        let b = codeOf Special;
    }
}
