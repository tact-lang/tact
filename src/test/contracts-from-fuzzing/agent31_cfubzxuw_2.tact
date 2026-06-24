message UniverseCalls {
    dummy: Int;
}

contract Test {
    // Allowed usage of '_' as discard parameter in receiver when the parameter type is a Message
    receive(_: UniverseCalls) {
    }
}
