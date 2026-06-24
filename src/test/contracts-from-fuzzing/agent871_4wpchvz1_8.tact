struct OneField {
    x: Int;
}

struct TwoFields {
    a: Int; b: Int;
}

struct ThreeFields {
    a: Int;
    b: Bool;
    c: String;
}

contract MultipleStructsFields {
    f1: OneField;
    f2: TwoFields;
    f3: ThreeFields;

    init() {
        self.f1 = OneField{ x: 1 };
        self.f2 = TwoFields{ a: 2, b: 3 };
        self.f3 = ThreeFields{ a: 4, b: true, c: "hi" };
    }
}