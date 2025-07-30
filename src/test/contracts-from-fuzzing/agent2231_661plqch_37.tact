struct CellMix {
    a: Cell;
    b: Cell?;
    c: Cell;
    d: Cell?;
}

contract CellMixContract {
    foo: CellMix;

    init() {
        self.foo = CellMix{
            a: emptyCell(),
            b: null,
            c: emptyCell(),
            d: null
        };
    }
}