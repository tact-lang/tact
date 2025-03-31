message(42) UniverseCalls {}

contract Example {
    receive(_: UniverseCalls) {
        // Valid: using _ as receiver parameter to discard message
    }
}