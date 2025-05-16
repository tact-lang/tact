struct ManyLayers {
    a: Int;
    b: Int?;
    c: Int as uint32;
    d: Int? as uint64;
    e: String?;
    f: Bool;
    g: Bool?;
}

contract ManyLayersTest {
    test: ManyLayers;
    init() {
        self.test = ManyLayers{
            a:1, b:null, c:3, d:null, e:null, f:true, g:null
        };
    }
}
