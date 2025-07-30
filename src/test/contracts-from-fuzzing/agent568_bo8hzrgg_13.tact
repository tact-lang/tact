struct HasSlice {
    s: Slice;
}

struct HasCell {
    c: Cell;
}

struct HoldsOthers {
    hs: HasSlice;
    hc: HasCell;
}

contract WithSlices {
    v: HoldsOthers;

    init() {
        self.v = HoldsOthers{
            hs: HasSlice{ s: emptyCell().asSlice() },
            hc: HasCell{ c: emptyCell() }
        };
    }
}