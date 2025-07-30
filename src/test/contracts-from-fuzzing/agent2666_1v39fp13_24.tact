struct ComboOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract ComboStorage {
    data: ComboOptional;

    init() {
        self.data = ComboOptional{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null,
        };
    }
}