struct StructA {
    x: Int;
}

struct StructB {
    y: Bool;
}

contract MultipleStructVars {
    a: StructA;
    b: StructB;

    init() {
        self.a = StructA{x: 5};
        self.b = StructB{y: true};
    }
}