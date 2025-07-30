struct ComplexStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Cell;
    h: Slice;
}

contract ManyFieldStorage {
    data: ComplexStruct;
    
    init() {
        self.data = ComplexStruct {
            a: 1,
            b: false,
            c: "test",
            d: null,
            e: "opt",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
        };
    }
}