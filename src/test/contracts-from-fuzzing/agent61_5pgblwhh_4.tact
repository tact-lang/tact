message UniverseCalls {}

contract Example {
    receive(_: UniverseCalls) {
        // Correct usage: discarding the parameter from UniverseCalls
    }
}
