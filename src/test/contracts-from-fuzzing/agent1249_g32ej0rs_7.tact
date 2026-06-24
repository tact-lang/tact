struct Remain {
    prefix: Int as uint32;
    rest: Slice as remaining;
}

contract TestContract {
    data: Remain;

    init() {
        self.data = Remain{
            prefix: 123456,
            rest: emptyCell().asSlice(),
        };
    }
}