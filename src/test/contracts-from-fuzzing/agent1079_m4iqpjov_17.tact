struct RemainingInNested {
    head: Int;
    rem: Slice as remaining;
}

contract RemainingTest {
    val: RemainingInNested;

    init() {
        self.val = RemainingInNested{
            head: 1,
            rem: emptyCell().asSlice()
        };
    }
}