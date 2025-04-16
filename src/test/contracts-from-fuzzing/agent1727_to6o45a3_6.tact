struct OptionalDeep {
    inner: Int?;
    deep: OptionalWrap?;
}

struct OptionalWrap {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptionalNest {
    data: OptionalDeep = OptionalDeep{};

    receive() {
        self.data = OptionalDeep{
            inner: 5,
            deep: OptionalWrap{
                s: "hi",
                n: 7,
                b: false,
            },
        };
    }
}