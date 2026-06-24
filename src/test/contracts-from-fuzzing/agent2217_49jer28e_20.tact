struct SOpt {
    a: Int?;
    b: Bool?;
    c: Cell?;
}

contract ManyOptFields {
    f1: SOpt;
    f2: SOpt;

    init() {
        self.f1 = SOpt{a:null,b:null,c:null};
        self.f2 = SOpt{a:null,b:null,c:null};
    }
}
