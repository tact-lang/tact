struct Sub1 {
    v1: Int;
    v2: Bool;
    v3: Int?;
}

struct Sub2 {
    s1: Sub1;
    s2: Sub1;
    flag: Bool;
}

contract MultiNested {
    nested: Sub2;

    init() {
        self.nested = Sub2{
            s1: Sub1{ v1: 1, v2: true, v3: null },
            s2: Sub1{ v1: 2, v2: false, v3: 3 },
            flag: true
        };
    }
}