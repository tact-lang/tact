struct RemainStruct {
    foo: Int;
    rest: Slice as remaining;
}

contract TestContract {
    v: RemainStruct;

    init() {
        let cell = beginCell().storeInt(5, 10).endCell();
        self.v = RemainStruct.fromCell(cell);
    }
}