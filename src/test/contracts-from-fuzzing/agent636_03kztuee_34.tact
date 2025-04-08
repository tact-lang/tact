struct RemainingBuilderStruct {
    a: Int;
    rest: Builder as remaining;
}

contract RemainingBuilderPersistent {
    data: RemainingBuilderStruct;

    init() {
        self.data = RemainingBuilderStruct{ a:5, rest: beginCell() };
    }
}
