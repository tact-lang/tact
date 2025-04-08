struct RemainTest {
    x: Int as uint16;
    y: Slice as remaining;
}

contract RemainingField {
    r: RemainTest;

    init() {
        self.r = RemainTest{ x: 123, y: "abc".asSlice() };
    }
}