struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Cell?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
    m: Int;
    n: Bool;
    o: String;
    p: Cell;
}

contract ManyFieldsContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1, b: true, c: "c", d: emptyCell(), e: null, f: null, g: null, h: null,
            i: emptyCell().asSlice(), j: null, k: myAddress(),
            l: null, m: 2, n: false, o: "o", p: emptyCell()
        };
    }
}