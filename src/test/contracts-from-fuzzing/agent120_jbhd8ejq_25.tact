message(1) MsgA {}
message(2) MsgB { val: Int; }

contract Test {
    m1: MsgA = MsgA{};
    m2: MsgB = MsgB{val:42};
}