struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    a: Int = 1;
    b: Bool = true;
}

contract TestContract {
    nestedOpt: NestedOptional;

    init() {
        self.nestedOpt = NestedOptional{ inner: Inner{} };
    }
}
