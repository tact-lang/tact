struct DeepNested {
    s: Nested;
    n: Int;
}

struct Nested {
    i: Int;
    b: Bool;
}

contract DeepNestedStructContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            s: Nested{
                i: 11,
                b: false,
            },
            n: 22,
        };
    }
}