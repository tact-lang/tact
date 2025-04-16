struct Remainer {
    s: Slice as remaining;
}

contract TestContract {
    data: Remainer;
    init() {
        self.data = Remainer{ s: emptyCell().asSlice() };
    }
}