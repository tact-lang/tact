struct OptionalsMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
}

contract ManyOptionals {
    s: OptionalsMany;
    init() {
        self.s = OptionalsMany{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null
        };
    }
}