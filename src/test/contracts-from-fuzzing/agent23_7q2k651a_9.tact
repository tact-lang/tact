message(42) UniverseCalls {}

contract Test {
    // Receiver using underscore to ignore the parameter value
    receive(_: UniverseCalls) {
        // No operation, just testing discard ability
    }

    get fun dummy(): Int {
        return 0;
    }
}
