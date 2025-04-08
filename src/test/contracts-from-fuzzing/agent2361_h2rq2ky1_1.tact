struct DeepInner {
    lucky: Int;
    flag: Bool;
}

struct MidLevel {
    maybeInner: DeepInner?;
    str: String;
}

contract StorageDeepNest {
    info: MidLevel;

    init() {
        self.info = MidLevel{
            maybeInner: DeepInner{
                lucky: 42,
                flag: true,
            },
            str: "Nested!",
        };
    }
}