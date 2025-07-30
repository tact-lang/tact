struct InnerMost {
    v: Int;
}

struct L2 {
    im: InnerMost;
}

struct L1 {
    l2: L2;
}

contract Deep4NestedStruct {
    field: L1;

    init() {
        self.field = L1{ l2: L2{ im: InnerMost{ v: 42 } } };
    }
}