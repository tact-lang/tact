struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: String;
    h: String;
    i: Int?;
    j: Bool?;
}

contract WideStruct {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            a:1, b:2, c:3, d:4, e:true, f:false, g:"g", h:"h", i:5, j:true
        };
    }
}