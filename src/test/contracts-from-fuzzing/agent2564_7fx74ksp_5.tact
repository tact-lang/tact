struct DeepNestedLvl3 {
    d1: Int;
    d2: Bool;
}

struct DeepNestedLvl2 {
    c1: DeepNestedLvl3;
    c2: String;
}

struct DeepNestedLvl1 {
    b1: DeepNestedLvl2;
    b2: Int?;
}

contract DeepNestContract {
    a1: DeepNestedLvl1;

    init() {
        self.a1 = DeepNestedLvl1{
            b1: DeepNestedLvl2{
                c1: DeepNestedLvl3{ d1: 5, d2: false },
                c2: "hello"
            },
            b2: null
        };
    }
}