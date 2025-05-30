message MsgA {}
message MsgB {}

contract Test {
    receive(msg: MsgA) {}
    receive(msg: MsgB) {}
    receive() {}
}