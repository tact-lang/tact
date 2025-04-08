struct NestedRemain {
    mainField: Int;
    remainS: Slice as remaining;
}

contract RemainingInsideStruct {
    f: NestedRemain;

    init() {
        self.f = NestedRemain{
            mainField: 1,
            remainS: emptyCell().asSlice()
        };
    }
}