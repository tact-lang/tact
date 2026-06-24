struct InA {
    a: Int;
    b: Bool;
}

struct InB {
    c: String;
    d: Int;
}

contract MultipleStructFields {
    x: InA;
    y: InB;

    init() {
        self.x = InA{ a: 1, b: true };
        self.y = InB{ c: "hi", d: 2 };
    }
}