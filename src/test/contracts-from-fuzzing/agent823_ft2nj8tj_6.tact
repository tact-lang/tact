struct DeepNest3 {
    a: Int;
}

struct DeepNest2 {
    nested: DeepNest3;
}

struct DeepNest1 {
    nested: DeepNest2;
}

contract DeepDeep {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{ nested: DeepNest2{ nested: DeepNest3{ a: 11 } } };
    }
}