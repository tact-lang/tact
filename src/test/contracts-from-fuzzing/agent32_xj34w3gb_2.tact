message UniverseCalls {}

contract Example {
    // Correct usage: discard the parameter using underscore in a receive function
    receive (_: UniverseCalls) {
    }
}
