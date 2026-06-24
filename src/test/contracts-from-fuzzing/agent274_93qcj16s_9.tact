struct StructWithRemaining {
    x: Int as uint8;
    y: Slice as remaining;
}

contract RemainingFieldTest {
    data: StructWithRemaining;

    init() {
        self.data = StructWithRemaining{
            x: 12,
            y: "hello".asComment().asSlice(),
        };
    }
}