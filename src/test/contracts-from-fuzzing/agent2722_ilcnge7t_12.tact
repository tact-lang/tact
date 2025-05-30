struct EmbeddedDefault {
    n: Int = 123;
    s: String = "default";
    b: Bool = false;
    o: Int?;
}

contract StructWithDefaults {
    data: EmbeddedDefault;

    init() {
        self.data = EmbeddedDefault{};
    }
}