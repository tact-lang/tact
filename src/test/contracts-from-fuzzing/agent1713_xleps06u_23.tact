struct NestOptionalWithDefault {
    inner: Int? = null;
}

struct Outer {
    nested: NestOptionalWithDefault? = null;
}

contract ComplexOptDefaults {
    f: Outer;
    init() {
        self.f = Outer{};
    }
}