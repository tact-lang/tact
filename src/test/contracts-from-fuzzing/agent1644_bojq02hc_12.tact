struct BigOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MultipleOptionals {
    field: BigOptional;

    init() {
        self.field = BigOptional{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}