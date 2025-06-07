struct SOpt {
    x: Int?;
}

contract SetOpt {
    s: SOpt;

    init() {
        self.s = SOpt{ x:null };
    }
}