// Valid: Using wildcard in receiver parameter with a message type
message Msg {
    a: Int;
}

contract Test {
    // Using _ as a discard parameter for a receiver expecting a message of type Msg
    receive(_: Msg) {
        // Do nothing
    }
}
