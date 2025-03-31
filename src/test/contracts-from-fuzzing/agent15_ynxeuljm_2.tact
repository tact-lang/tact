message(42) UniverseCalls {}

contract TestValidReceiver {
    receive(_: UniverseCalls) {
        // Valid: underscore used to discard the message value
    }
}
