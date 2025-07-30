struct MultiLayer {
    a: Int;
    b: String;
}

struct MiddleWrap {
    layer: MultiLayer;
    flag: Bool;
}

struct OuterWrap {
    mid: MiddleWrap;
    note: String;
}

contract MultiWrapTest {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            mid: MiddleWrap{
                layer: MultiLayer{ a: 7, b: "text" },
                flag: false,
            },
            note: "outer",
        };
    }
}