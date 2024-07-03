message(1) Msg1 {}
message(1) Msg2 {}

contract Test {
    bounced(msg: Msg1) { }
    bounced(msg: Msg2) { }
}

