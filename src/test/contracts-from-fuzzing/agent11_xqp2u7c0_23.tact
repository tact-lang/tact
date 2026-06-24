struct RemainingFieldInner {
    a: Int as int32;
    rem: Slice as remaining;
}

contract RemainingFieldTest {
    f: RemainingFieldInner;

    init() {
        self.f = RemainingFieldInner{
            a: 77,
            rem: emptyCell().asSlice()
        };
    }
}