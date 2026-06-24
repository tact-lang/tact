struct HasCellRem {
    prefix: Int;
    rest: Cell as remaining;
}

contract CellRemain {
    f: HasCellRem;

    init() {
        self.f = HasCellRem{
            prefix: 1,
            rest: emptyCell()
        };
    }
}