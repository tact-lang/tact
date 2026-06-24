struct WeirdPrimNest {
    a: Int;
    b: Bool;
    c: InnerW;
}

struct InnerW {
    d: String;
    e: Bool;
}

contract StrangeStorage {
    f: WeirdPrimNest;

    init() {
        self.f = WeirdPrimNest{
            a:10, b:true, c:InnerW{d:"x", e:false}
        };
    }
}