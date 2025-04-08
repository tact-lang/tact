struct CellWrap {
    c1: Cell;
    c2: Cell?;
}

struct CellOuter {
    base: CellWrap;
    extra: Int;
}

contract CellStorage {
    content: CellOuter;

    init() {
        self.content = CellOuter{
            base: CellWrap{
                c1: emptyCell(),
                c2: null,
            },
            extra: 777,
        };
    }
}