message(5) Msg5 {}

message(6) Msg6 {}

contract Test {
    receive(_: Msg5) {}
    receive(_: Msg6) {}
}
