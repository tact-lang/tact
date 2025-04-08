struct NestedWithSerialization {
    f1: Int as uint8;
    f2: Bool;
    f3: String;
    f4: Int?;
}

contract PersistedNestedSerialized {
    x: NestedWithSerialization;

    init() {
        self.x = NestedWithSerialization{
            f1: 55,
            f2: true,
            f3: "hello",
            f4: null
        };
    }
}