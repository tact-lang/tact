struct BigNested {
    i: Int;
    s: String;
    n: Nested;
}

struct Nested {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
}

contract StructInStruct {
    big: BigNested;

    init() {
        self.big = BigNested{
            i: 1,
            s: "hi",
            n: Nested{
                a: 2,
                b: "ok",
                c: true,
                d: emptyCell()
            }
        };
    }
}
