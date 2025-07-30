struct InnerOpt {
    x: Int;
}

struct OuterOpt {
    maybe: InnerOpt?;
}

contract OptionalNestedStructContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{ maybe: null };
    }
}