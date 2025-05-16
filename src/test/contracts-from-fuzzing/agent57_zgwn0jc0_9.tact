message(42) UniverseCalls {}

contract Test {
    receive(_: UniverseCalls) {
        // underscore parameter usage
    }
}
