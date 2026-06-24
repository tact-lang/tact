message UniverseCalls {}

contract Test {
    // Valid usage: underscore as discard parameter in a receiver function
    receive(_: UniverseCalls) {}
}
