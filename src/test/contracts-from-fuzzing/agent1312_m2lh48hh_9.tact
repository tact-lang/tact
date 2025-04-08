struct Remain {
    prefix: Int;
    suffix: Slice as remaining;
}

contract TestContract {
    data: Remain;

    init() {
        self.data = Remain{
            prefix: 42,
            suffix: emptyCell().asSlice()
        };
    }
}