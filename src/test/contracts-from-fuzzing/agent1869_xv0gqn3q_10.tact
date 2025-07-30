struct SOpt {
    a: Int?;
    b: Int?;
}

contract StructOptContract {
    s1: SOpt;
    s2: SOpt;

    init() {
        self.s1 = SOpt{ a:null, b:null };
        self.s2 = SOpt{ a:null, b:null };
    }
}