message UniverseCalls {}

contract TestContract {
    // Receiver function with underscore to discard the parameter
    receive(_: UniverseCalls) {
        // No further processing
    }
}
