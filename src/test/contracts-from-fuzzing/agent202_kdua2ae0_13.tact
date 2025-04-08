struct StructWithRemaining {
    head: Int as int32;
    tail: Slice as remaining;
}

contract RemainingFieldStorage {
    data: StructWithRemaining;

    init() {
        self.data = StructWithRemaining{
            head: 777,
            tail: emptyCell().asSlice(),
        };
    }
}