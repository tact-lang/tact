struct StructOne {
    a: Int;
}

struct StructTwo {
    b: Int;
}

contract TwoStructFields {
    s1: StructOne;
    s2: StructTwo;

    init() {
        self.s1 = StructOne{a:1};
        self.s2 = StructTwo{b:2};
    }
}