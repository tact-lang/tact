struct DoubleOptionalNested {
    a: Inner?;
}

struct Inner {
    b: Bool?;
}

contract NestedDoubleOptionals {
    f: DoubleOptionalNested;

    init() {
        self.f = DoubleOptionalNested{ a: Inner{b: null} };
    }
}