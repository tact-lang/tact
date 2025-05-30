struct DefaultsAndNested {
    a: Int = 5;
    b: Bool = true;
    c: Inner;
}

struct Inner {
    val: Int = 99;
}

contract NestedDefaults {
    f: DefaultsAndNested;

    init() {
        self.f = DefaultsAndNested{ c: Inner{} };
    }
}