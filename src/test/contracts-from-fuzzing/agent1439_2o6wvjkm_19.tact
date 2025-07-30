struct InnerOpt {
    foo: Int?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract OptionLayers {
    o: OuterOpt;
    init() {
        self.o = OuterOpt{middle: MiddleOpt{ inner: null }};
    }
}