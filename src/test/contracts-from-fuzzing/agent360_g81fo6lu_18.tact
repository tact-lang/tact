struct Sub1 {
    f: Int;
}

struct Sub2 {
    g: Bool;
}

contract TestContract {
    s1: Sub1;
    s2: Sub2;
    a: Int;
    b: String;

    init() {
        self.s1 = Sub1{ f: 123 };
        self.s2 = Sub2{ g: false };
        self.a = 77;
        self.b = "x";
    }
}