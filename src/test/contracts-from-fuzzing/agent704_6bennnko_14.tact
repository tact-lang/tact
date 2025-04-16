struct RemainingTest {
    x: Int;
    rem: Slice as remaining;
}

contract RemainingField {
    value: RemainingTest;

    init() {
        self.value = RemainingTest{
            x: 5,
            rem: emptyCell().asSlice()
        };
    }
}