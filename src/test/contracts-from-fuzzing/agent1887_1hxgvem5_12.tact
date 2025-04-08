struct CellStruct {
    data: Cell;
    ok: Bool;
}

contract CellInStorage {
    cdata: CellStruct;

    init() {
        self.cdata = CellStruct{
            data: beginCell().storeUint(12345, 20).endCell(),
            ok: false,
        };
    }
}