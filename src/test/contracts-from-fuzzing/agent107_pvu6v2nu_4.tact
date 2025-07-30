contract C(param: Int) {}

contract D {
    receive() {
        // Using initOf on a contract with parameters, providing the required argument.
        let c_init = initOf C(42);
    }
}
