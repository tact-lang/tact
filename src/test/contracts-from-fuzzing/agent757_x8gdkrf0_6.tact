struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint8;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int as uint32;
}

contract TestContract {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            a:1, b:true, c:"hi", d:2, e:false, f:"bye", g:3, h:true, i:"ok", j:4
        };
    }
}