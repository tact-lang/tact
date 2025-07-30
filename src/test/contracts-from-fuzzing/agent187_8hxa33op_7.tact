struct OptionalDeeper {
    x: Int?;
    y: String?;
}

struct OptionalMid {
    inner: OptionalDeeper?;
    flag: Bool;
}

contract OptionalNestedOpt {
    data: OptionalMid;
    init() {
        self.data = OptionalMid{
            inner: OptionalDeeper{
                x: null,
                y: "hello",
            },
            flag: true,
        };
    }
}
