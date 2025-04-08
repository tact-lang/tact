struct Data {
    x: Int;
    extra: Slice as remaining;
}

contract TestContract {
    d: Data;

    init() {
        self.d = Data{
            x: 42,
            extra: emptyCell().asSlice(),
        };
    }
}