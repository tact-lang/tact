struct RemainingField {
    val: Int;
    data: Slice as remaining;
}

contract RemainingTest {
    field: RemainingField;

    init() {
        self.field = RemainingField{
            val:123,
            data:emptyCell().asSlice()
        };
    }
}