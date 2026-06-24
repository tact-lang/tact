struct RemainderTestStruct {
    x: Int;
    y: Cell as remaining;
}

contract RemainderContract {
    s: RemainderTestStruct;

    init() {
        self.s = RemainderTestStruct{ x: 1, y: emptyCell() };
    }
}