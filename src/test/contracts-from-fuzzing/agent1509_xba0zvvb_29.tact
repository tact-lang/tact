struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
}

contract ManyNulls {
    s: SOpt;
    init() {
        self.s = SOpt{
            a:null,b:null,c:null,d:null,e:null
        };
    }
    receive() {
        if (self.s.b == null) {
            self.s.b = true;
        }
    }
}