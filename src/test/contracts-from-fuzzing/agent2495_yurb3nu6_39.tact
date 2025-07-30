struct OptNestedWrap {
    v: Int;
    w: SomeInner?;
}

struct SomeInner {
    a: Int;
    b: Bool;
}

contract OptInnerInside {
    val: OptNestedWrap;

    init() {
        self.val = OptNestedWrap{
            v: 1,
            w: null
        };
    }
}