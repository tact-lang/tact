struct DeeplyNested {
    d1: Int;
    d2: OptionalStruct;
    d3: NestedLevel1;
}

struct NestedLevel2 {
    alpha: Int;
    beta: Bool;
}

struct NestedLevel1 {
    s2field: NestedLevel2;
    c: Cell;
}

struct OptionalStruct {
    p: Int?;
    q: Bool?;
    s: String?;
}

contract Test5 {
    dn: DeeplyNested;

    init() {
        self.dn = DeeplyNested{
            d1: 9,
            d2: OptionalStruct{ p: null, q: false, s: "hi" },
            d3: NestedLevel1{
                s2field: NestedLevel2{ alpha: 1, beta: true },
                c: emptyCell(),
            },
        };
    }
}