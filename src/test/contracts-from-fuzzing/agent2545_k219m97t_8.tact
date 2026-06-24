struct VariantOne {
    a: Int;
}

struct VariantTwo {
    b: Bool;
}

contract MultipleStructFields {
    f1: VariantOne;
    f2: VariantTwo;

    init() {
        self.f1 = VariantOne{a: 42};
        self.f2 = VariantTwo{b: true};
    }
}
