struct DeepMany {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int as uint32;
    h: Int?;
    i: Int as int64;
    j: String;
}

contract ComplexStructFields {
    x: DeepMany;

    init() {
        self.x = DeepMany{
            a:1, b:null, c:true, d:null, e:"a", f:null, g:3, h:null, i:4, j:"b",
        };
    }

    receive() {
        let v = self.x;
    }
}