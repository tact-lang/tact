struct NestedLevel2 {
    alpha: Int;
    beta: Bool;
}

struct NestedLevel1 {
    s2field: NestedLevel2;
    c: Cell;
}

contract Test3 {
    deep: NestedLevel1;

    init() {
        self.deep = NestedLevel1{
            s2field: NestedLevel2{
                alpha: 1,
                beta: false,
            },
            c: emptyCell(),
        };
    }
}