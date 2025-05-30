struct HasSlice {
    s: Slice;
}

contract TestContract {
    data: HasSlice;

    init() {
        self.data = HasSlice{s: emptyCell().asSlice()};
    }
}