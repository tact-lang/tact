struct Tail {
    x: Int;
    extra: Slice as remaining;
}

contract RemainingStructField {
    data: Tail;

    init() {
        self.data = Tail{
            x: 123,
            extra: emptyCell().asSlice(),
        };
    }
}
