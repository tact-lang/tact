struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
}

contract ManyOptionals {
    bigOpt: BigOptional;

    init() {
        self.bigOpt = BigOptional{ a:null, b:null, c:null, d:null, e:null, f:null, g:null };
    }
}