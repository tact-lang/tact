struct DeepStringOpt {
    s: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    s2: String?;
}

contract OptionalNestedStrings {
    data: DeepStringOpt;

    init() {
        self.data = DeepStringOpt{
            s: null,
            inner: null,
        };
    }
}