struct PrimOpts {
    x: Int?;
    b: Bool?;
}

struct OuterOptWrap {
    inner: PrimOpts;
}

contract PrimitiveOptsNested {
    var: OuterOptWrap;

    init() {
        self.var = OuterOptWrap{
            inner: PrimOpts{ x: null, b: null }
        };
    }
}