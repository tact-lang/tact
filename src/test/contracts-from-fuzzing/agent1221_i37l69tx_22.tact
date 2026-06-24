struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
}

contract ComboStruct {
    value: Combo;

    init() {
        self.value = Combo{
            a: 5, b: false, c: "q",
            d: null, e: null, f: null,
            g: emptyCell(), h: emptyCell().asSlice(), i: beginCell(), j: myAddress()
        };
    }
}