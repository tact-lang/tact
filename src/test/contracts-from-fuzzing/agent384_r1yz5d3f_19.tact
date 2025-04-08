struct Parametric {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
}

contract UseParametric {
    p: Parametric;

    init() {
        self.p = Parametric{
            a:1, b:null, c:true, d:null, e:myAddress(), f:null
        };
    }
}