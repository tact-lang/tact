struct OneField {
    num: Int;
}

struct TwoField {
    a: Int;
    s: String;
}

struct ThreeField {
    b: Bool;
    i: Int;
    t: String;
}

contract VariousStructs {
    f1: OneField;
    f2: TwoField;
    f3: ThreeField;

    init() {
        self.f1 = OneField{ num: 1 };
        self.f2 = TwoField{ a: 2, s: "two" };
        self.f3 = ThreeField{ b: true, i: 3, t: "three" };
    }
}
