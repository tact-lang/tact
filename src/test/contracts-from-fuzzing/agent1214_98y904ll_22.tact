struct Compose {
    a: SubA;
    b: SubB;
}

struct SubA {
    x: Int;
}

struct SubB {
    y: Bool;
}

contract Test22 {
    composed: Compose;
    init() {
        self.composed = Compose{
            a: SubA{ x: 5 },
            b: SubB{ y: true },
        };
    }
}