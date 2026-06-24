struct DeepNested {
    nested: Nested;
    flag: Bool;
}

struct Nested {
    inner: Inner;
    text: String;
}

struct Inner {
    value: Int;
    optionalVal: Bool?;
}

contract DeepNestTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            nested: Nested{
                inner: Inner{
                    value: 1,
                    optionalVal: true,
                },
                text: "abc",
            },
            flag: false,
        };
    }
}