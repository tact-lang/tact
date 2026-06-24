contract B(x: Int) {
    receive() {}
}

contract TestBP {
    receive() {
        let b_init = initOf B(10);
        let b_code = codeOf B;
    }
}
