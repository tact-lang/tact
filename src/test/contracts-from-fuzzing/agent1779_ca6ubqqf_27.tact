struct RemainNested {
    a: Int;
    b: Cell as remaining;
}

contract RemainingInStruct {
    data: RemainNested;
    init() {
        self.data = RemainNested{a:42, b: emptyCell()};
    }
}