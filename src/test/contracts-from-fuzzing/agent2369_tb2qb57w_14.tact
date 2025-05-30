struct ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Cell?;
    g: Slice?;
    h: Address?;
    i: String?;
    j: Bool?;
}

contract LotsOfOptionals {
    data: ManyOptionalFields;
    init() {
        self.data = ManyOptionalFields{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null
        };
    }
}