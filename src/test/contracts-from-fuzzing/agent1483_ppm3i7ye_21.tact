struct Sub1 {
    a: Int;
}

struct Sub2 {
    b: Int;
}

contract MultipleNestedFields {
    s1: Sub1;
    s2: Sub2;

    init() {
        self.s1 = Sub1{ a: 10 };
        self.s2 = Sub2{ b: 20 };
    }
}