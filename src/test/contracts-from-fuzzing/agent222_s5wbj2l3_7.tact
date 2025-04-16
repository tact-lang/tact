struct MixedLongList {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String?;
    j: Int;
    k: Bool?;
    l: String;
    m: Int?;
    n: Bool;
    o: String;
    p: Int;
}

contract MixedFields {
    field: MixedLongList;

    init() {
        self.field = MixedLongList{
            a:1, b:true, c:"x", d:null, e:false, f:"y",
            g:2, h:true, i:null, j:3, k:null, l:"z",
            m:null, n:false, o:"w", p:4
        };
    }
}