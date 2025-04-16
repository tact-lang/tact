struct ComplexNestedOptionals {
    a: Int?;
    inner: Inner?
}

struct Inner {
    x: String?;
    y: Bool;
}

contract ComplexOptNest {
    s: ComplexNestedOptionals;

    init() {
        self.s = ComplexNestedOptionals{ a:null, inner:null };
    }
}