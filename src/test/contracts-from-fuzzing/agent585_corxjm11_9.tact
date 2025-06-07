struct Sub1 {
    a: Int;
}

struct Sub2 {
    b: Sub1;
}

struct Sub3 {
    c: Sub2;
}

contract DeepNestStruct {
    d: Sub3;

    init() {
        self.d = Sub3{ c: Sub2{ b: Sub1{ a: 88 } } };
    }
}
