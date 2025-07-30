// Test 1: Valid usage of wildcard parameter in a receiver function
message ValidMessage {}

contract ValidReceiver {
    // Wildcard parameter discards the message value, as per docs
    receive(_: ValidMessage) {}
}
