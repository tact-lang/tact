struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

contract TestContract {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            a:1, b:true, c:"c", d:null, e:false, f:"f", g:7, h:"h", i:true, j:5
        };
    }
}