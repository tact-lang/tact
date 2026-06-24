struct Variant1 {
    a: Int;
}

struct Variant2 {
    b: Int;
}

contract MultiVariant {
    f1: Variant1;
    f2: Variant2;

    init() {
        self.f1 = Variant1{ a:1 };
        self.f2 = Variant2{ b:2 };
    }
}