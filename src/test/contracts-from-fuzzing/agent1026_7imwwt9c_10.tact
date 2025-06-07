struct StorageData {
    c: Cell;
    s: Slice;
}

contract TestContract {
    data: StorageData;

    init() {
        let cellVal = beginCell().storeUint(123, 8).endCell();
        self.data = StorageData{
            c: cellVal,
            s: cellVal.asSlice()
        };
    }
}