// Message with implicit empty body (no fields)
message Empty {}

contract Test {
    receive(msg: Empty) {
    }
}