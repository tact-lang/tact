struct Large {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: String;
    h: Int?;
    i: Bool?;
    j: String;
}

contract BigStorage {
    field: Large;

    init() {
        self.field = Large{
            a:1, b:true, c:2, d:false, e:3, f:true, g:"hello",
            h:null, i:null, j: "world"
        };
    }
}