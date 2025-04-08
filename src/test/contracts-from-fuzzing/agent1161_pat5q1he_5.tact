struct DeeplyNested {
    field: Int;
}

struct Wrapper1 {
    nested: DeeplyNested;
}

struct Wrapper2 {
    nested: Wrapper1;
}

struct Wrapper3 {
    nested: Wrapper2;
}

contract DeepNestContract {
    data: Wrapper3;

    init() {
        self.data = Wrapper3{ nested: Wrapper2{ nested: Wrapper1{ nested: DeeplyNested{ field: 7 } } } };
    }
}