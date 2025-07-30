struct RemainStruct {
    prefixValue: Int as uint16;
    rest: Slice as remaining;
}

contract RemainingTest {
    remainData: RemainStruct;

    init() {
        self.remainData = RemainStruct{
            prefixValue: 255,
            rest: emptyCell().asSlice()
        };
    }
}