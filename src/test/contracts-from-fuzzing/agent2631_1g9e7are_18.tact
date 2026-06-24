struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
    f: String?;
    g: Builder?;
}

contract OptionalFields {
    data: Opts;

    init() {
        self.data = Opts{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}