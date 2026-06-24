struct RemainingSliceStruct {
    a: Int as int64;
    rest: Slice as remaining;
}

contract RemainingSliceContract {
    f: RemainingSliceStruct;

    init() {
        self.f = RemainingSliceStruct{
            a: 123456,
            rest: emptyCell().asSlice()
        };
    }
}