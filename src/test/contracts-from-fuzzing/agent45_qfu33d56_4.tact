struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: String;
    i: String;
    j: Bool?;
}

contract LotsFieldsTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a:1, b:2, c:3, d:4, e:5, f:true, g:false, h:"hi", i:"world", j:null
        };
    }
}