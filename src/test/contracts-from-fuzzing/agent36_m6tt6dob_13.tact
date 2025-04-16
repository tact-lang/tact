struct SOpt {
    a: Int;
    b: Int?;
}

contract StructWithInnerOpt {
    s: SOpt;
    init() {
        self.s = SOpt{a:1,b:null};
    }
}