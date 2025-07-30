contract B(param: Int) {}

contract Tester2 {
    receive() {
        // Valid usage of initOf with a contract that takes parameters
        let cell = initOf B(123);
    }
}