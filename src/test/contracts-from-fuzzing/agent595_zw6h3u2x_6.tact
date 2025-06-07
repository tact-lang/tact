struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Int?;
    h: Bool?;
}

contract ManyOptionalFields {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null,
        };
    }
}