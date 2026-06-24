struct InnerLayer {
    n: Int;
}

struct MiddleLayer {
    inL: InnerLayer;
    flag: Bool?;
}

struct OuterLayer {
    mid: MiddleLayer?;
    label: String;
}

contract OptionalDeep {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            mid: null,
            label: "outer"
        };
    }
}