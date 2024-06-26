message(1) Msg1 {}
message(1) Msg2 {}

contract Test {
    receive(msg: Msg1) { }
    receive(msg: Msg2) { }
}

