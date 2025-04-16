struct Sub {
    data: Int;
}

struct Outer {
    innerOpt: Sub?;
    name: String;
}

contract OptStructMix {
    f1: Sub?;
    f2: Outer;

    init() {
        self.f1 = null;
        self.f2 = Outer{ innerOpt: null, name: "x" };
    }
}