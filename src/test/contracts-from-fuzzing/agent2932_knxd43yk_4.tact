struct MixStruct {
    aa: Int;
    bb: Bool;
    cc: String;
    dd: Cell;
    ee: Slice;
}

contract ComboPersistent {
    val: Int;
    flag: Bool;
    text: String;
    cell: Cell;
    slice: Slice;
    nested: MixStruct;

    init() {
        self.val = 5;
        self.flag = true;
        self.text = "text";
        self.cell = emptyCell();
        self.slice = emptyCell().asSlice();
        self.nested = MixStruct{
            aa: 1, bb: false, cc: "s", dd: emptyCell(), ee: emptyCell().asSlice()
        };
    }
}