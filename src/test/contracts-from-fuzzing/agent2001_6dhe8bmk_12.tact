struct SFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
}

struct SWrap {
    s: SFlat;
}

contract StructInStructField {
    field: SWrap;

    init() {
        self.field = SWrap{
            s: SFlat{
                a: 5,
                b: true,
                c: "abc",
                d: emptyCell(),
            }
        };
    }
}