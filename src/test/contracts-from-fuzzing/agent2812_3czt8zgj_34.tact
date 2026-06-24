struct HasSlice {
    sl: Slice;
    flag: Bool;
}

struct HasCell {
    cl: Cell;
    hs: HasSlice;
}

contract NestedSliceCell {
    s: HasCell;

    init() {
        self.s = HasCell{
            cl: emptyCell(),
            hs: HasSlice{
                sl: emptyCell().asSlice(),
                flag: true
            }
        };
    }
}