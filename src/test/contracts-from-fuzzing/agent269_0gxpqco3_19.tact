struct LotsOpt {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
}

contract ManyOptStructs {
    s: LotsOpt?;

    init() {
        self.s = LotsOpt{ a:1, b:"x", c:true, d:2 };
    }
}