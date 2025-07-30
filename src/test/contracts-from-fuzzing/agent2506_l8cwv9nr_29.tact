struct OptionalLayer {
    optInt: Int?;
    optStr: String?;
}

struct TopLevel {
    nested: OptionalLayer;
    note: String;
}

contract OptionalLayers {
    val: TopLevel;
    init() {
        self.val = TopLevel{
            nested: OptionalLayer{
                optInt: null,
                optStr: null,
            },
            note: "hello",
        };
    }
}
