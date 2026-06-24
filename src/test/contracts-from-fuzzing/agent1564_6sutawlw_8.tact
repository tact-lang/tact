struct WithLongFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract LongFieldStruct {
    val: WithLongFields;

    init() {
        self.val = WithLongFields{
            a:1, b:true, c:"c", d:2, e:false,
            f:"f", g:3, h:true, i:"i", j:4
        };
    }
}