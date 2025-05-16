struct ManyStrings {
    a: String;
    b: String?;
    c: String?;
    d: String;
}

contract StringMix {
    f: ManyStrings;
    opt: ManyStrings?;
    init() {
        self.f = ManyStrings{ a:"a", b:null, c:null, d:"d" };
        self.opt = null;
    }
}