struct MixedFields {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
    f: String;
    g: Int?;
    h: Bool;
    i: String?;
    j: Int?;
}

contract TestContract {
    data: MixedFields;

    init() {
        self.data = MixedFields{
            a:null, b:true, c:null, d:42, e:false,
            f:"hello", g:null, h:false, i:null, j:null
        };
    }
}