struct Combined{
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
}

contract Combo {
    field: Combined;

    init() {
        self.field = Combined{
            a:1,
            b:null,
            c:"x",
            d:null,
            e:myAddress(),
            f:null,
            g:emptyCell(),
            h:null,
            i:emptyCell().asSlice(),
            j:null
        };
    }
}