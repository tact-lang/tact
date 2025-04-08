struct SUnusualLayout {
    a: Int;
    b: String?;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
}

contract UnusualFieldOrder {
    data: SUnusualLayout;

    init() {
        self.data = SUnusualLayout{
            a:1,
            b:null,
            c:true,
            d:"d",
            e:null,
            f:null
        };
    }
}