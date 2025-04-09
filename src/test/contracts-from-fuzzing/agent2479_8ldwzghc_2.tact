struct DeepNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

struct MidNested {
    deep: DeepNested;
    optionalInt: Int?;
    text: String;
}

contract StructNestedTest {
    data: MidNested;
    init() {
        self.data = MidNested{
            deep: DeepNested{
                a: 7,
                b: true,
                c: "hello",
                d: myAddress(),
            },
            optionalInt: null,
            text: "text",
        };
    }
}