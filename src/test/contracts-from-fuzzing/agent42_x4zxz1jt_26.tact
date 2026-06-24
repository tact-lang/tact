message HasOptionalMessage {
    m: Inner?
}

message Inner {
    x: Int
}

contract Test {
    receive() {}
}