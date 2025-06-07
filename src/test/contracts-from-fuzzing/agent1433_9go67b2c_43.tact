struct SmolX {
    a: Int;
}

struct SmolY {
    b: SmolX;
}

struct SmolZ {
    c: SmolY;
}

contract SmallDeep {
    d: SmolZ;

    init() {
        self.d = SmolZ{ c: SmolY{ b: SmolX{ a: 1 } } };
    }
}
