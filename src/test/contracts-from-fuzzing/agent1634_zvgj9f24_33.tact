struct ManyOptional {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: Cell?;
    g: Slice?;
}

contract ManyOptionalFields {
    opts: ManyOptional;

    init() {
        self.opts = ManyOptional{
            a:null, b:null, c:null,
            d:null, e:null, f:null, g:null
        };
    }
}