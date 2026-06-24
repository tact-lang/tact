message(42) UniverseCalls {}

contract Test {
    // Valid: using '_' as a discard parameter in a receive function
    receive(_: UniverseCalls) {}
}
