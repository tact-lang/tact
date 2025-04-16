struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract LargerOpt {
    o: BigOptional;

    init() {
        self.o = BigOptional{
            a:null, b:null, c:null,
            d:null, e:null, f:null
        };
    }
}
