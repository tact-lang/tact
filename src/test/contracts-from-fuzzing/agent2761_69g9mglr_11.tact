struct Inner5 { q: Int; r: Bool?; s: String; }

contract ContractWithManyStructFields {
    f1: Inner5;
    f2: Inner5;
    f3: Inner5;
    f4: Inner5;
    f5: Inner5;
    
    init() {
        self.f1 = Inner5{q:1,r:null,s:"a"};
        self.f2 = Inner5{q:2,r:true,s:"b"};
        self.f3 = Inner5{q:3,r:false,s:"c"};
        self.f4 = Inner5{q:4,r:null,s:"d"};
        self.f5 = Inner5{q:5,r:true,s:"e"};
    }
}
