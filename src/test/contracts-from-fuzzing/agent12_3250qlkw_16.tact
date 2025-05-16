struct SOpt {
    f1: Int;
    opt: Int?;
}

contract OptStructDefaults {
    rec: SOpt;

    init() {
        self.rec = SOpt { f1: 10, opt: null };
    }
}