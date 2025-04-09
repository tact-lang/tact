struct C {
    s: Slice;
}

struct SL {
    c: Cell;
    s: C;
}

contract SliceStruct {
    f: SL;

    init() {
        self.f = SL{
            c: emptyCell(),
            s: C{
                s: emptyCell().asSlice()
            }
        };
    }
}