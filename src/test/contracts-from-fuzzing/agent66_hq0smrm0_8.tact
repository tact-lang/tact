struct NestedOption {
    inner: InnerOpt?;
}

struct InnerOpt {
    a: Int;
    b: String;
}

contract Test {
    val: NestedOption;
    init() {
        self.val = NestedOption{
            inner: InnerOpt{
                a: 11,
                b: "ok",
            },
        };
    }
}
