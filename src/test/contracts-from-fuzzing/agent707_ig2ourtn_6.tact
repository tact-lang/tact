struct StringCellStruct {
    text: String;
    cellData: Cell;
}

contract MixedPersistentFields {
    storage: StringCellStruct;

    init() {
        self.storage = StringCellStruct{
            text: "test",
            cellData: emptyCell()
        };
    }
}