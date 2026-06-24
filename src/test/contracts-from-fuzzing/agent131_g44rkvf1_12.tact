struct Combo1 {
    intVal: Int;
    boolVal: Bool;
}

struct Combo2 {
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
}

struct BothCombos {
    c1: Combo1;
    c2: Combo2;
}

contract MixedPersistence {
    storageVal: BothCombos;

    init() {
        self.storageVal = BothCombos{
            c1: Combo1{ intVal:5, boolVal:true },
            c2: Combo2{
                sliceVal: emptyCell().asSlice(),
                cellVal: emptyCell(),
                strVal: "hi"
            }
        };
    }
}