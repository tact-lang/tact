message(99) InnerMsg {
    foo: Int? = null;
}

message(100) OuterMsg {
    bar: InnerMsg? = null;
}

contract MsgOptionalNested {
    data: OuterMsg = OuterMsg{};
}