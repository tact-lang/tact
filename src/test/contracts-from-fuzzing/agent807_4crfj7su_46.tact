// test long combination of optionals, messages and struct
struct PlainStruct {
    foo: Int?;
}

message(301) MsgLeaf {
    content: PlainStruct?;
}

message(302) MsgMid {
    leaf: MsgLeaf?;
}

contract DeepOptionChain {
    data: MsgMid? = null;
}