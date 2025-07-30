struct DeepSlice {
    data: Slice as remaining;
}

contract TestContract {
    d: DeepSlice;

    init() {
        self.d = DeepSlice{ data: emptyCell().asSlice() };
    }
}
