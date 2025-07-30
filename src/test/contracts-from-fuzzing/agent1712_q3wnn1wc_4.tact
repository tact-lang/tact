struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract ManyFields {
    data: ManyPrimitives;
    
    init() {
        self.data = ManyPrimitives{
            a: 7,
            b: false,
            c: "seven",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}