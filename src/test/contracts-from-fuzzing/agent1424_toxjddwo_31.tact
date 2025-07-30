struct Naive {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiPersistent {
    v1: Naive;
    v2: Naive;
    v3: Naive;
    v4: Naive;

    init() {
        self.v1 = Naive{a:1,b:true,c:"1"};
        self.v2 = Naive{a:2,b:false,c:"2"};
        self.v3 = Naive{a:3,b:true,c:"3"};
        self.v4 = Naive{a:4,b:false,c:"4"};
    }
}