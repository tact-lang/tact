struct OptionalNested {
    s: String?;
    i: Int?;
    inner: DeepOptional?;
}

struct DeepOptional {
    flag: Bool?;
    text: String?;
}

contract OptionalNestedContract {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            s: null,
            i: null,
            inner: null,
        };
    }
}