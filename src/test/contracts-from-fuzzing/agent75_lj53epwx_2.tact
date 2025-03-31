message UniverseCalls {}

contract Example {
    // Valid usage: wildcard parameter in receiver function discards the message value
    receive(_: UniverseCalls) {}
}
