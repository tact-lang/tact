struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Int;
    k: Address;
    l: Cell;
}

contract LotsOfTypes {
    field: ManyFields;
    
    init() {
        self.field = ManyFields{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: "hello",
            j: 123,
            k: myAddress(),
            l: emptyCell(),
        };
    }
}