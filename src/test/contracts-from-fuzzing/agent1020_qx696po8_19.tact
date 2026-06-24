struct Flat {
    a: Int; b: Bool;
    c: String; d: Int?;
    e: Bool?; f: String?;
    g: Int; h: Bool;
    i: String; j: Int?;
}

contract FlatVarietyTest {
    storage: Flat;

    init() {
        self.storage = Flat{
            a:1, b:true, c:"x",
            d:null, e:null, f:null,
            g:2, h:false, i:"y",
            j:null
        };
    }
}