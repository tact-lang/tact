contract D(x: Int) {
    // No init function because we use contract parameters
    receive() {}
}

contract TestValidParam {
    receive() {
        let d_init = initOf D(123);
        let d_code = codeOf D;
    }
}
