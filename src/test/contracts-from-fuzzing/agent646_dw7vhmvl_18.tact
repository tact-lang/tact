struct CellContainer {
    main: Cell;
    backup: Cell?;
    temp: Cell?;
}

contract CellContainerTest {
    data: CellContainer;

    init() {
        self.data = CellContainer{
            main: emptyCell(),
            backup: null,
            temp: null
        };
    }
}