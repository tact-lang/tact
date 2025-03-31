contract D(param: Int) {}

contract TestParams {
    receive() {
        let d_init = initOf D(42);
        let d_code = codeOf D;
    }
}
