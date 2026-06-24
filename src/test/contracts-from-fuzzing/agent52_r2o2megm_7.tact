// Valid Usage: Receiver function with wildcard parameter (as per documentation)
message MyMessage {}

contract Test {
    // Using wildcard in receiver parameter discards the incoming message
    receive (_: MyMessage) {}
}
