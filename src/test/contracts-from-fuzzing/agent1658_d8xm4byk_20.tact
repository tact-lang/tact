struct HasSlice {
    s: Slice;
    optS: Slice?;
}

struct HasCell {
    c: Cell;
    optC: Cell?;
}

contract StorageTest {
    sData: HasSlice;
    cData: HasCell;

    init() {
        self.sData = HasSlice{ s: emptyCell().asSlice(), optS: null };
        self.cData = HasCell{ c: emptyCell(), optC: null };
    }
}