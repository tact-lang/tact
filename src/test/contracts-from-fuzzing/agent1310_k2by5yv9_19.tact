struct LowLevel {
    code: Cell;
    data: Slice;
}

contract TestContract {
    low: LowLevel;

    init() {
        self.low = LowLevel{
            code: emptyCell(),
            data: emptyCell().asSlice()
        };
    }
}
