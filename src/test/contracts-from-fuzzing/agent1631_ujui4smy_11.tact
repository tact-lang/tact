struct IntHolder { val: Int; }
struct BoolHolder { val: Bool; }
struct AddressHolder { val: Address; }
struct SliceHolder { val: Slice; }
struct CellHolder { val: Cell; }

struct MixedNested {
    i: IntHolder;
    b: BoolHolder;
    a: AddressHolder;
    s: SliceHolder;
    c: CellHolder;
}

contract MixDeep {
    m: MixedNested;

    init() {
        self.m = MixedNested{
            i: IntHolder{ val: 1 },
            b: BoolHolder{ val: true },
            a: AddressHolder{ val: myAddress() },
            s: SliceHolder{ val: emptyCell().asSlice() },
            c: CellHolder{ val: emptyCell() },
        };
    }
}