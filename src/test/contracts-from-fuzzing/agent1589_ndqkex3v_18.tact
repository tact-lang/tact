struct DeepOptional {
    nested: InnerOptional?;
    value: Int;
}

struct InnerOptional {
    flag: Bool?;
    text: String?;
}

contract OptionalInOptional {
    payload: DeepOptional;

    init() {
        self.payload = DeepOptional{
            nested: InnerOptional{
                flag: null,
                text: "hi",
            },
            value: 42,
        };
    }
}