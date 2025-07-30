struct RemainingField {
    prefix: Int;
    suffix: Slice as remaining;
}

contract RemainingStructTest {
    val: RemainingField;

    init() {
        self.val = RemainingField{ prefix:123, suffix: emptyCell().asSlice() };
    }
}
