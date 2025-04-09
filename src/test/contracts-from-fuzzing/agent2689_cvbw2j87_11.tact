struct WithCellAndBuilder {
    data: Cell;
    construct: Builder;
}

contract CellBuilderStorage {
    s: WithCellAndBuilder;

    init() {
        self.s = WithCellAndBuilder{
            data: emptyCell(),
            construct: beginCell(),
        };
    }
}