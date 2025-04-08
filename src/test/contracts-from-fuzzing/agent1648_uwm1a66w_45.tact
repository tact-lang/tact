struct OneOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructOptOnly {
    s: OneOpt;
    init() {
        self.s = OneOpt{ a:null, b:null, c:null };
    }
}