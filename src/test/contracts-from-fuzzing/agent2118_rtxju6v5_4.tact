struct InnerOpt {
    flag: Bool?;
    count: Int;
}

struct OuterOpt {
    text: String;
    inner: InnerOpt?;
}

contract OptionalNested {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            text: "hi",
            inner: null,
        };
    }
}