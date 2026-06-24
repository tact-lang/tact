struct DeepNested {
    p: Nested;
    flag: Bool;
    note: String;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract DeepNestedStructTest {
    info: DeepNested;

    init() {
        self.info = DeepNested{
            p: Nested{
                x: 7,
                y: false,
            },
            flag: true,
            note: "deep",
        };
    }
}