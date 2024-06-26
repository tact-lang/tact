message(1) Msg1 {}
message(1) Msg2 {}

contract Test {
    external(msg: Msg1) { }
    external(msg: Msg2) { }
}

