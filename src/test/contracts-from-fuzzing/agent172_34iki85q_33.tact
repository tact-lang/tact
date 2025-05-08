struct InnerOpt {
    data: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
    label: String;
}

contract NestedOptionalUninit {
    outer: OuterOpt;

    init() {
        self.outer = OuterOpt{
            inner: null,
            label: "outer",
        };
    }
}