struct Deep {
    a: Int;
    b: NestedA;
}

struct NestedA {
    c: Bool;
    d: NestedB;
}

struct NestedB {
    e: String;
    f: NestedC;
}

struct NestedC {
    g: Cell;
    h: Address;
}

contract TestDeep {
    data: Deep;

    init() {
        self.data = Deep{
            a: 1,
            b: NestedA{
                c: true,
                d: NestedB{
                    e: "hi",
                    f: NestedC{
                        g: emptyCell(),
                        h: myAddress()
                    }
                }
            }
        };
    }
}