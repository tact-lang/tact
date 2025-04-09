struct OptionalNested {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
    text: String?;
}

contract OptionalDeep {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            inner: null,
        };
    }
}