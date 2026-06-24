struct OptionalsMixed {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
}

contract MixedOptFields {
    s: OptionalsMixed;

    init() {
        self.s = OptionalsMixed{
            a:null,
            b:true,
            c:null,
            d:myAddress(),
            e:emptyCell(),
            f:emptyCell().asSlice(),
            g:null,
            h:null,
        };
    }
}