// nesting a message inside struct inside persistent contract var
message(7) MsgInner {
    x: Int;
}

struct WrapMsg {
    m: MsgInner;
}

contract MsgNestedStore {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{
            m: MsgInner{ x:77 },
        };
    }
}