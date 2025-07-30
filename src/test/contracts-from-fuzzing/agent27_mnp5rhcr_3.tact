message Msg {}

contract Test {
    // Valid usage: discard parameter in receiver, using a proper message type
    receive(_: Msg) {
        // nothing to do
    }
}