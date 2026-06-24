struct Combo {
    ival: Int;
    bval: Bool?;
    sval: String;
    aval: Address?;
    cval: Cell;
    slval: Slice?;
    build: Builder;
}

contract ComboStructOwner {
    combo: Combo;

    init() {
        self.combo = Combo{
            ival: 1,
            bval: null,
            sval: "x",
            aval: null,
            cval: emptyCell(),
            slval: null,
            build: beginCell()
        };
    }
}
