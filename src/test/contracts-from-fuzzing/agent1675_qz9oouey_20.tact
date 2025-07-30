struct HasSlice {
    s: Slice;
}

struct HasCell {
    c: Cell;
}

struct HasAddr {
    a: Address;
}

contract SlicesCellsAddresses {
    x: HasSlice;
    y: HasCell;
    z: HasAddr;

    init() {
        self.x = HasSlice{ s: emptyCell().asSlice() };
        self.y = HasCell{ c: emptyCell() };
        self.z = HasAddr{ a: myAddress() };
    }
}