contract B(param: Int) {
    receive() {}
}

contract TestA {
    receive() {
        let b_init = initOf B(42);
        let b_code = codeOf B;
    }
}
