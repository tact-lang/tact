struct NestedOptions {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalInStruct {
    nested: NestedOptions;

    init() {
        self.nested = NestedOptions{
            x: null,
            y: true,
            z: null,
        };
    }
}