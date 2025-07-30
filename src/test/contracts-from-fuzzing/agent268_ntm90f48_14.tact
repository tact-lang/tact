struct S1 {
    v1: Int; v2: Bool;
}

struct S2 {
    nest1: S1; 
    nest2: S1;
    v3: Bool?;
}

contract MultiLayer {
    s: S2;
    init() {
        self.s = S2{
            nest1: S1{v1:1,v2:true},
            nest2: S1{v1:2,v2:false},
            v3:null
        };
    }
}