struct OptionalNestedInner {
    f: Bool;
}

struct OuterOpt {
    innerOpt: OptionalNestedInner?;
    s: String;
}

contract OptInStructField {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            innerOpt: null,
            s: "check"
        };
    }
}