contract OptionalNestedStructInit {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            inner: null,
            name: "test"
        };
    }
}

struct OuterOpt {
    inner: InnerOpt?;
    name: String;
}

struct InnerOpt {
    x: Int;
    y: Bool;
}