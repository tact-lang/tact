struct WrapPrimitive {
    i: Int;
}

struct OuterWrap {
    inner: WrapPrimitive;
}

contract PrimitiveWrapper {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            inner: WrapPrimitive{ i: 42 }
        };
    }
}
