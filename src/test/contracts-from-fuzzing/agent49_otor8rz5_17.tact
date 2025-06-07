struct HasRemainder {
    a: Int;
    reminder: Slice as remaining;
}

contract TestContract {
    rem: HasRemainder;

    init() {
        self.rem = HasRemainder{
            a: 123,
            reminder: emptyCell().asSlice(),
        };
    }
}
