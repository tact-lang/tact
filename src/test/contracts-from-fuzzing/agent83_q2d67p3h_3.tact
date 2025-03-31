message(42) UniverseCalls {}

contract ValidReceiver {
    // Valid usage: discarding the UniverseCalls message parameter
    receive(_: UniverseCalls) {}
}
