// testing struct with nested message
message(0x42) InnerMsg {
    foo: Int;
}

struct OuterWrap {
    bar: Bool;
    baz: InnerMsg;
}

contract WrapTest {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            bar: true,
            baz: InnerMsg{ foo: 99 }
        };
    }
}