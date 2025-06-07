struct InnerD {
    i: Int;
    b: Bool;
}

struct OuterD {
    o: InnerD;
    j: String?;
}

contract BigOpt {
    q: OuterD?;

    init() {
        self.q = OuterD{
            o: InnerD{ i:1, b:true },
            j: null
        };
    }
}
