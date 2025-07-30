struct Sub1 {
    foo: Int;
}

struct Sub2 {
    bar: Bool;
}

contract TwoSubs {
    a: Sub1;
    b: Sub2;

    init() {
        self.a = Sub1{foo: 42};
        self.b = Sub2{bar: true};
    }
}
