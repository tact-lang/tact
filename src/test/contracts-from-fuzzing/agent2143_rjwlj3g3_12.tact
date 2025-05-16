contract MultipleNestedStructs {
    s1: StructA;
    s2: StructB;

    init() {
        self.s1 = StructA{x: 1, y: 2};
        self.s2 = StructB{flag: true, str: "hi"};
    }
}

struct StructA {
    x: Int;
    y: Int;
}

struct StructB {
    flag: Bool;
    str: String;
}