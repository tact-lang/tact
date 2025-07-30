struct DeepOptional {
    a: Int?;
    s: String?;
}

struct NestedOpt {
    inner: DeepOptional?;
}

contract Test {
    nestedOpt: NestedOpt;

    init() {
        self.nestedOpt = NestedOpt{
            inner: null,
        };
    }
}