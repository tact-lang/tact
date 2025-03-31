contract B(param: Int) {}

contract TestB {
    receive() {
        // Valid usage: contract with parameters
        let b_init = initOf B(42);
        let b_code = codeOf B;
    }
}
