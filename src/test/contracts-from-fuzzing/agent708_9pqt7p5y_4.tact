struct Nested {
    val: Int;
    opt: Int?;
    flag: Bool;
}

contract ManyNested {
    n1: Nested;
    n2: Nested;
    n3: Nested;
    n4: Nested;

    init() {
        self.n1 = Nested{ val:1, opt:null, flag:true };
        self.n2 = Nested{ val:2, opt:3, flag:false };
        self.n3 = Nested{ val:4, opt:null, flag:true };
        self.n4 = Nested{ val:5, opt:6, flag:false };
    }
}
