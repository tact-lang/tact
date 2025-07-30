struct DeepInner {
    x: Int;
}

message(0x1122) InnerMsg {
    foo: DeepInner;
    bar: Bool;
}

struct MiddleWrap {
    m: InnerMsg;
    s: String;
}

contract CrossNest {
    data: MiddleWrap;

    init() {
        self.data = MiddleWrap{
            m: InnerMsg{foo:DeepInner{x:5}, bar:true},
            s: "ok",
        };
    }
}