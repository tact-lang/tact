struct LotsOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Bool?;
    f: String?;
    g: Int?;
}

contract MultiOptField {
    data: LotsOptional;

    init() {
        self.data = LotsOptional{
            a:null, b:null, c:true, d:"str", e:false, f:"val", g:1
        };
    }
}