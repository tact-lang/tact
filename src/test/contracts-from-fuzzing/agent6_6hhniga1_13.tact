struct HugeOptionalStruct {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: String?;
    f: Bool?;
    g: Bool?;
    h: Address?;
    j: Cell?;
    k: Slice?;
}

contract TestContract {
    hos: HugeOptionalStruct;

    init() {
        self.hos = HugeOptionalStruct{
            a:null, b:1, c:null, d:"a", e:null,
            f:null, g:true, h:null, j:null, k:null
        };
    }
}
