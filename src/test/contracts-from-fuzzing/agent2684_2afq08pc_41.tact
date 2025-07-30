struct StructOne {
    a: Int;
}

struct StructTwo {
    b: Int;
}

contract TwoFieldsStructs {
    s1: StructOne;
    s2: StructTwo;

    init() {
        self.s1 = StructOne{a:123};
        self.s2 = StructTwo{b:456};
    }
}
