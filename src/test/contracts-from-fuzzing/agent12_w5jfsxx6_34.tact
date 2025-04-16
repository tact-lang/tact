struct NestedStruct {
    inner: InnerMsg;
}

message(4321) InnerMsg {
    val: Int;
}

message(1234) OuterMsg {
    x: Int;
    nest: NestedStruct;
}

contract MsgWrap {
    outer: OuterMsg?;
}