struct ContainSlice {
    s: Slice;
}

contract TestContract {
    data: ContainSlice;

    init() {
        self.data = ContainSlice{ s: emptyCell().asSlice() };
    }
}