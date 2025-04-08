struct SOpt {
    a: Int?;
    b: Bool?;
}

contract BothNulls {
    s: SOpt;

    init() {
        self.s = SOpt{a:null,b:null};
    }
}