message(42) UniverseCalls {}

contract Test {
    receive(_: UniverseCalls) {
        // This receiver uses the underscore to discard the parameter value.
    }
}
