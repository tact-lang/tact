struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsStorage {
    f: NestedOptional;

    init() {
        self.f = NestedOptional{
            x: null,
            y: true,
            z: "hi"
        };
    }
}