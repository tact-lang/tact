struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract MultiOptionals {
    v: SOpt;
    init() {
        self.v = SOpt{a:null,b:null,c:null,d:null};
    }
    receive() {}
}