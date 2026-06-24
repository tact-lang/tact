struct NM {
    i: Int;
    s: String;
    b: Bool;
}

contract ManyNested {
    n1: NM;
    n2: NM;
    n3: NM;
    n4: NM;

    init() {
        self.n1 = NM{ i:1,s:"1",b:true };
        self.n2 = NM{ i:2,s:"2",b:false };
        self.n3 = NM{ i:3,s:"3",b:true };
        self.n4 = NM{ i:4,s:"4",b:false };
    }
}
