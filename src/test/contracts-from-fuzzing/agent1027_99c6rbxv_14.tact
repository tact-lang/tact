struct DataPack {
    i8: Int as int8;
    flag: Bool;
    text: String;
    cellVal: Cell;
}

contract StructSerialization {
    data: DataPack;

    init() {
        self.data = DataPack{
            i8: 5,
            flag: true,
            text: "abc",
            cellVal: emptyCell()
        };
    }
}
