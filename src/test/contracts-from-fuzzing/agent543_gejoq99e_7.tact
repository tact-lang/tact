struct InnerA {
    x: Int;
}

struct InnerB {
    y: Int;
}

struct Combo {
    a: InnerA;
    b: InnerB;
}

contract MultipleNested {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: InnerA{x:11},
            b: InnerB{y:22}
        };
    }
}
