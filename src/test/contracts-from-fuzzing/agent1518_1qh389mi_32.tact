struct SOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract AddOpt {
    f: SOpt;

    init() {
        self.f = SOpt { a:null, b:true, c:null };
    }
}