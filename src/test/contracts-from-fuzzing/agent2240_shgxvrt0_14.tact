struct HasAddress {
    addr: Address;
}

struct HasCell {
    cell: Cell;
}

struct HasSlice {
    slice: Slice;
}

struct Bundle {
    a: HasAddress;
    c: HasCell;
    s: HasSlice;
    flag: Bool;
}

contract MultiTypeNested {
    storage: Bundle;

    init() {
        self.storage = Bundle{
            a: HasAddress{ addr: myAddress() },
            c: HasCell{ cell: emptyCell() },
            s: HasSlice{ slice: emptyCell().asSlice() },
            flag: true
        };
    }
}