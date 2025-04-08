struct TwoLayer {
    a: Int;
    nested: NestedLayer;
}

struct NestedLayer {
    optionalInt: Int?;
    optionalString: String?;
    flag: Bool;
}

contract TwoLayerOpt {
    s: TwoLayer;
    init() {
        self.s = TwoLayer{
            a: 5,
            nested: NestedLayer{
                optionalInt: null,
                optionalString: "test",
                flag: true
            }
        };
    }
}