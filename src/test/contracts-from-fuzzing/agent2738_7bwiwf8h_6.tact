struct Inner {
    a: Int;
}

struct Middle {
    b: Int;
    inr: Inner;
}

struct Outer {
    m: Middle;
}

contract ContractA {
    f: Outer;

    init() {
        self.f = Outer{m: Middle{b:2, inr: Inner{a:1}}};
    }
}

contract ContractB {
    g: Middle;

    init() {
        self.g = Middle{b:2, inr: Inner{a:1}};
    }
}
