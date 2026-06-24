message Dummy {}

contract Test {
    // Valid use: wildcard as a receiver parameter discarding the Dummy message
    receive(_: Dummy) {
        // message consumed, no further processing
    }
}
