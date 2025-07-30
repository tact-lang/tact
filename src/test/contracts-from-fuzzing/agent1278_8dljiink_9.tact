struct DataHolder {
    raw: Cell;
    view: Slice;
    comment: String;
}

contract TestContract {
    holder: DataHolder;

    init() {
        let cellVal = emptyCell();
        let sliceVal = cellVal.asSlice();
        self.holder = DataHolder{
            raw: cellVal,
            view: sliceVal,
            comment: "low level",
        };
    }
}