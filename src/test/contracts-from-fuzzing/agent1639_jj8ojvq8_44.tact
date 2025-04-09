struct SOpt {
    n: Int?;
    b: Bool?;
    s: String?;
}

contract StructOptDefaults {
    so: SOpt;

    init() {
        self.so = SOpt{ n:null, b:null, s:null };
    }
}
