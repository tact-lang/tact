struct Inner {
    nested: InnerMost?;
}

struct InnerMost {
    flag: Bool;
}

contract NestedOptionalStructField {
    data: Inner;

    init() {
        self.data = Inner{
            nested: null
        };
    }
}
