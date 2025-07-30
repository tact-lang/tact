struct StructA {
    flagA: Bool;
    numA: Int;
}

struct StructB {
    flagB: Bool;
    numB: Int;
}

struct Comb {
    a: StructA;
    b: StructB;
}

contract ComposeNested {
    comb: Comb;

    init() {
        self.comb = Comb{
            a: StructA{ flagA: true, numA: 3 },
            b: StructB{ flagB: false, numB: 7 },
        };
    }
}