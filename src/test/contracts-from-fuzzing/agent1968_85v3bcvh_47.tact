struct Complex {
    a: Int;
    b: Int?;
    c: Int as uint5;
    d: Bool;
    e: String;
    f: Address?;
    g: Cell;
    h: Slice;
}

contract Test48 {
    field: Complex;
    init() {
        self.field = Complex{
            a:1,
            b:null,
            c:15,
            d:true,
            e:"s",
            f:null,
            g:emptyCell(),
            h:emptyCell().asSlice()
        };
    }
}