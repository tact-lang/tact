struct Sub1 {
    x: Int;
}

struct Sub2 {
    y: Bool;
}

struct Sub3 {
    z: String;
}

struct Compound {
    f1: Sub1;
    f2: Sub2;
    f3: Sub3;
}

contract StructMix {
    data: Compound;

    init() {
        self.data = Compound{
            f1: Sub1{ x: 1 },
            f2: Sub2{ y: true },
            f3: Sub3{ z: "ok" }
        };
    }
}
