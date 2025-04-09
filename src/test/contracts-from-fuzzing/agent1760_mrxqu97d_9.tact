struct SOpt {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
}

contract OptFields {
    f: SOpt;

    init() {
        self.f = SOpt{
            a:null, b:true, c:42, d:null, e:null
        };
    }
}