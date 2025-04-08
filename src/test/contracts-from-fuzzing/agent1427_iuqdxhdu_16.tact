struct RemainingSliceTester {
    body: Slice as remaining;
}

contract RemainingSliceContract {
    s: RemainingSliceTester;
    init() {
        self.s = RemainingSliceTester{
            body: emptyCell().asSlice()
        };
    }
}