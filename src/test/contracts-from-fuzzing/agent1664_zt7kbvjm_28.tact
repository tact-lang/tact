struct Hybrid {
    a: Int;
    b: Int?;
    c: Bool = true;
    d: String?;
    e: Bool?;
}

contract HybridPersist {
    rec: Hybrid;

    init() {
        self.rec = Hybrid{
            a: 5,
            b: null,
            d: "ok",
            e: null
        };
    }
}