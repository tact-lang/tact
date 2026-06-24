struct DeeplyNested {
    inner: InnerMost;
}

struct InnerMost {
    optionalInt: Int?;
    optionalBool: Bool?;
    nested: Deeper?;
}

struct Deeper {
    str: String;
    number: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: InnerMost{
                optionalInt: 123,
                optionalBool: true,
                nested: Deeper{
                    str: "test",
                    number: 777,
                },
            },
        };
    }
}
