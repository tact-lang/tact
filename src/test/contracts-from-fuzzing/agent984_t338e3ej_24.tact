struct OneRef {
    c: Cell;
}

struct TwoRefs {
    a: Cell;
    b: Cell;
}

struct NestedRefs {
    first: OneRef;
    second: TwoRefs;
}

contract CellRefsTest {
    n: NestedRefs;

    init() {
        self.n = NestedRefs{
            first: OneRef{c: emptyCell()},
            second: TwoRefs{a: emptyCell(), b: emptyCell()}
        };
    }
}