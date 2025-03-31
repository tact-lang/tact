message UniverseCalls {}

contract ValidReceiver {
    // Valid usage: discarding the message parameter with underscore
    receive(_: UniverseCalls) {}
}
