contract ArrContract {
    sA: StructA;

    init() {
        self.sA = StructA{
            nestedA: StructB{ val: 1 },
            nestedB: StructB{ val: 2 },
            nestedC: StructB{ val: 3 },
        };
    }
}

struct StructA {
    nestedA: StructB;
    nestedB: StructB;
    nestedC: StructB;
}

struct StructB {
    val: Int;
}
