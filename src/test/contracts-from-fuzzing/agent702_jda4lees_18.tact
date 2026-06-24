message(2) InnerMsg {
    bar: Int;
}

struct Holder {
    inner: InnerMsg;
}

message(1) MainMsg {
    foo: Int;
    nested: InnerMsg;
}

contract MsgMix {
    one: MainMsg = MainMsg{foo: 5, nested: InnerMsg{bar: 6}};
    two: InnerMsg = InnerMsg{bar: 7};
    s: Holder = Holder{inner: InnerMsg{bar:8}};
    init() {}
}