struct OptionalNested {
    s: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    data: String?;
}

contract OptionalNestedContract {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{
            s: null,
            inner: InnerOpt{ flag: true, data: null }
        };
    }
}