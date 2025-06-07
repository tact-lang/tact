struct NestedOptional {
    inner: Int?;
}

struct OuterOptional {
    nested: NestedOptional?;
}

contract TestContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{ nested: null };
    }
}
