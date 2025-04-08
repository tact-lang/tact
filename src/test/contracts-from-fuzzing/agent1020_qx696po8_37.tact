struct OptionalCellStruct {
    data: Cell?;
    flag: Bool;
}

contract OptionalCellTest {
    s: OptionalCellStruct;

    init() {
        self.s = OptionalCellStruct{
            data: null,
            flag: true
        };
    }
}