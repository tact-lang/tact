struct NestedWithMixed {
    s: String;
    b: Bool;
    optInt: Int?;
    deep: DeepNested;
}

struct DeepNested {
    flag: Bool;
    number: Int;
    text: String?;
}

contract NestedMixedTest {
    field: NestedWithMixed;

    init() {
        self.field = NestedWithMixed{
            s: "hello",
            b: true,
            optInt: null,
            deep: DeepNested{
                flag: true,
                number: 42,
                text: null,
            },
        };
    }
}