struct DeepNestA {
    val: Int;
}

struct DeepNestB {
    a: DeepNestA;
}

struct DeepNestC {
    b: DeepNestB;
}

struct DeepNestD {
    c: DeepNestC;
}

struct DeepNestE {
    d: DeepNestD;
}

contract VeryDeepNested {
    data: DeepNestE;

    init() {
        self.data = DeepNestE{ d: DeepNestD{ c: DeepNestC{ b: DeepNestB{ a: DeepNestA{ val: 99 } } } } };
    }
}
