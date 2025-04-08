struct NestedOpt {
    x: Int?;
    y: Bool?;
}

contract OptionalNested {
    storage: NestedOpt?;
    init() {
        self.storage = NestedOpt{
            x: null,
            y: true,
        };
    }
}