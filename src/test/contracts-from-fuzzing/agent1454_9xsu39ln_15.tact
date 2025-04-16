struct Inner {
    x: Int;
}

struct OuterOptNested {
    nested: Inner?;
}

contract OptNestedNoInit {
    complex: OuterOptNested;

    init() {
        self.complex = OuterOptNested{ nested: null };
    }
}