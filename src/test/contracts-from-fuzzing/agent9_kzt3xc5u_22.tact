struct SliceCell {
    s: Slice;
    c: Cell;
}

struct StringAddr {
    str: String;
    addr: Address;
}

contract CompoundNested {
    val1: SliceCell;
    val2: StringAddr;

    init() {
        self.val1 = SliceCell{ s: emptyCell().asSlice(), c: emptyCell() };
        self.val2 = StringAddr{ str: "abc", addr: myAddress() };
    }
}