struct OptionalMid {
    foo: Int?;
    bar: String?;
}

struct OuterOptLayer {
    innerOpt: OptionalMid?;
    x: Int;
}

contract OptMidLayer {
    nestedOpt: OuterOptLayer;

    init() {
        self.nestedOpt = OuterOptLayer{ innerOpt: null, x:42 };
    }
}