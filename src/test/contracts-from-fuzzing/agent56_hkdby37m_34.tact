struct SoMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Int?;
    g: Bool?;
    h: String?;
}

contract OptionStructFull {
    all: SoMany;

    init() {
        self.all = SoMany{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null
        };
    }
}