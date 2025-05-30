message TestMsg {}

contract Test {
    // Valid usage: wildcard parameter to discard received message of type TestMsg in a receiver function
    receive(_: TestMsg) {
        // No usage of the parameter
    }
}