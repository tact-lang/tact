struct NestedInner {
    num: Int;
}

struct OuterWrap {
    inner: NestedInner;
    comment: String;
}

contract StructInStructString {
    data: OuterWrap;

    init() {
        self.data = OuterWrap {
            inner: NestedInner { num: 456 },
            comment: "ok"
        };
    }
}