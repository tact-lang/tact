message(99) InnerMsg { foo: Int; }

struct WrapOpt {
    m: InnerMsg?;
}

contract MsgOptStruct {
    w: WrapOpt = WrapOpt{};
}