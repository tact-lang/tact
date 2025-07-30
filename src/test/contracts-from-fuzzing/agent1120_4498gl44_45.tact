struct InnerMost {
    final: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterLayer {
    mid: Middle;
    flag: Bool;
    text: String;
}

contract NestedMultiType {
    data: OuterLayer;
    init() {
        self.data = OuterLayer{
            mid: Middle{inner: InnerMost{final:88}},
            flag: true,
            text: "xyz"
        };
    }
}