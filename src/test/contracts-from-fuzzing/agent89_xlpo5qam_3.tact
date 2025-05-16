message UniverseCalls {}

contract Test {
    // Valid usage: underscore as a discard parameter in receiver
    // According to documentation, naming a parameter with '_' discards its value
    receive(_: UniverseCalls) {
        // no operation
    }
}