struct MixNested {
    a: Int;
    b: Bool;
    optNested: OptNested;
    deep: DeepNested;
}

struct OptNested {
    flag: Bool?;
    comment: String?;
    number: Int?;
}

struct DeepNested {
    d1: D1;
}

struct D1 {
    d2: D2;
}

struct D2 {
    value: Int;
}

contract ComplexTest {
    data: MixNested;
    init() {
        self.data = MixNested{
            a: 10,
            b: false,
            optNested: OptNested{ flag: null, comment: null, number: null },
            deep: DeepNested{ d1: D1{ d2: D2{ value: 5 } } }
        };
    }
}