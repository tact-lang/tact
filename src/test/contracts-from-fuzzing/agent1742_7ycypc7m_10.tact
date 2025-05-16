struct NestedOptionals {
    v1: Int?;
    v2: Bool?;
    v3: String?;
}

contract OptionalDeep {
    nestedOpt: NestedOptionals?;

    init() {
        self.nestedOpt = NestedOptionals{
            v1: 5,
            v2: false,
            v3: "hey",
        };
    }
}