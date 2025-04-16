struct WideOptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract WideOptionalPrimitives {
    state: WideOptStruct;

    init() {
        self.state = WideOptStruct{
            a:null, b:null, c:null, d:null, e:null, f:null,
            g:null, h:null, i:null, j:null, k:null, l:null,
        };
    }
}
