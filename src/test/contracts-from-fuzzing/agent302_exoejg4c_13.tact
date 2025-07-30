struct CellOptions {
    one: Cell;
    two: Cell?;
    sl: Slice;
    slOpt: Slice?;
}

contract CellOptTest {
    x: CellOptions;

    init() {
        self.x = CellOptions{
            one: emptyCell(),
            two: null,
            sl: emptyCell().asSlice(),
            slOpt: null
        };
    }
}