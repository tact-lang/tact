struct SOpt {
    val: Int?;
}

contract OptStructFields {
    s1: SOpt;
    s2: SOpt?;

    init() {
        self.s1 = SOpt{ val:null };
        self.s2 = null;
    }
}