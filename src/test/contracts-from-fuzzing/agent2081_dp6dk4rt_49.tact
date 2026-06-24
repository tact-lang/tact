struct InnerOnce {
    a: Int;
}
struct StructWithRemaining {
    prefix: Int;
    rem: Slice as remaining;
}

contract RemainingTest {
    data: StructWithRemaining;
    init() {
        self.data = StructWithRemaining{
            prefix: 5,
            rem: emptyCell().asSlice(),
        };
    }
}