struct Inner {
    x: Int;
}

struct OuterOptNested {
    nested: Inner?;
}

contract OptNestedDefaulted {
    complex: OuterOptNested;

    init() {
        self.complex = OuterOptNested{};
    }
}