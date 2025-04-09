// Test nested struct with all those optionals
struct Combo {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    stringOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
}

contract ComboNested {
    c: Combo;
    init() {
        self.c = Combo{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            stringOpt: null,
            cellOpt: null,
            sliceOpt: null
        };
    }
}