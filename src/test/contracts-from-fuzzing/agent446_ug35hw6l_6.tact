struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    x: Int;
}

contract OptionalNested {
    store: OuterOpt;

    init() {
        self.store = OuterOpt {
            inner: null,
            x: 5
        };
    }
}