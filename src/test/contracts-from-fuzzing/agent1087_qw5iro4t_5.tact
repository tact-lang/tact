struct S1 {
    f1: Int;
    f2: Bool;
    f3: Address;
}

struct S2 {
    s1_1: S1;
    s1_2: S1;
    s1_3: S1;
}

contract TestContract {
    bigNested: S2;
    
    init() {
        self.bigNested = S2{
            s1_1: S1{f1:1,f2:true,f3:myAddress()},
            s1_2: S1{f1:2,f2:false,f3:myAddress()},
            s1_3: S1{f1:3,f2:true,f3:myAddress()},
        };
    }

    receive() {}
}