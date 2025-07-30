struct F {
    x: Int;
    y: Int?;
    s: String;
    t: String?;
}

contract Fields {
    f: F;

    init() {
        self.f = F{ x:1, y:null, s:"a", t:"b" };
    }
}