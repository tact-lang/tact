struct MixPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
}

contract TestContract {
    data: MixPrimitives;
    init() {
        self.data = MixPrimitives{
            a:1,
            b:true,
            c:myAddress(),
            d:emptyCell(),
            e:emptyCell().asSlice(),
            f:"hello",
            g:null,
            h:null,
            i:null,
            j:null
        };
    }
}
