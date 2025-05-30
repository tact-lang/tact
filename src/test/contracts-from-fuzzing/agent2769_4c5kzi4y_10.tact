struct Large {
    a: Int; b: Int; c: Int;
    d: Bool; e: Bool;
    f: String; g: String;
    h: Int?; i: Int?; j: Int?;
    k: Bool?; l: Bool?;
    m: String?; n: String?;
}

contract HugeFields {
    data: Large;

    init() {
        self.data = Large{
            a:1, b:2, c:3,
            d:true, e:false,
            f:"x", g:"y",
            h:null, i:10, j:null,
            k:true, l:null,
            m:"hello", n:null,
        };
    }
}