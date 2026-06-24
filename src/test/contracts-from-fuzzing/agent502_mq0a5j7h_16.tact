struct StrNest {
    text: String;
}

struct CellNest {
    c: Cell;
    s: StrNest;
}

contract ComboDeep {
    data: CellNest;

    init() {
        self.data = CellNest{
            c: emptyCell(),
            s: StrNest{
                text: "deep"
            }
        };
    }
}