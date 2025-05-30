struct InnerMost {
    a: Int;
}

struct MiddleLayer {
    im: InnerMost;
}

struct OuterLayer {
    ml: MiddleLayer;
}

contract TestDeepStructs {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{ml: MiddleLayer{im: InnerMost{a:42}}};
    }

    receive() {
        let tmp = self.data;
    }
}