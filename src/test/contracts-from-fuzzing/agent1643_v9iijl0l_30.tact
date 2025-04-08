struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
}

contract ManyOptionalsFields {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}
