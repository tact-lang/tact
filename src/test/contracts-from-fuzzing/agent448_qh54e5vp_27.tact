struct SOpt {
    a: Int?;
    b: Bool?;
}

contract StructOfOptionals {
    s1: SOpt;
    s2: SOpt;

    init() {
        self.s1 = SOpt{a:null, b:true};
        self.s2 = SOpt{a:1, b:null};
    }
}