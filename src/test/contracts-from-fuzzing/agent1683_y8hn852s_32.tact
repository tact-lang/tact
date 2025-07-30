struct StructWithManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract PersistsManyStruct {
    val: StructWithManyFields;

    init() {
        self.val = StructWithManyFields{
            a: 1, b: true, c: myAddress(), d: "hi", e: emptyCell(), f: emptyCell().asSlice(),
            g: null, h: null, i: null, j: null
        };
    }

    receive() {
        self.val = StructWithManyFields{
            a: 2, b: false, c: myAddress(), d: "bye", e: emptyCell(), f: emptyCell().asSlice(),
            g: 55, h: true, i: "abc", j: myAddress()
        };
    }
}