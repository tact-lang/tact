struct HasRem {
    first: Int;
    tail: Slice as remaining;
}

contract TestContract {
    data: HasRem;

    init() {
        self.data = HasRem{
            first: 7,
            tail: emptyCell().asSlice()
        };
    }
}