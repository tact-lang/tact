struct Giant {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    a1: Address;
    a2: Address?;
    c1: Cell;
    c2: Cell?;
    sl1: Slice;
    sl2: Slice?;
    bu1: Builder;
    bu2: Builder?;
    i3: Int;
    i4: Int?;
    b3: Bool;
    b4: Bool?;
    s3: String;
    s4: String?;
    a3: Address;
    a4: Address?;
    c3: Cell;
    c4: Cell?;
    sl3: Slice;
    sl4: Slice?;
    bu3: Builder;
    bu4: Builder?;
}

contract GiantPersist {
    data: Giant;
    init() {
        self.data = Giant{
            i1:1,i2:null,b1:true,b2:null,s1:"A",s2:null,
            a1:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"), a2:null,
            c1:emptyCell(), c2:null, sl1:emptyCell().asSlice(), sl2:null,
            bu1:beginCell(), bu2:null, i3:3, i4:null, b3:false, b4:null,
            s3:"B", s4:null, a3:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"), a4:null,
            c3:emptyCell(), c4:null, sl3:emptyCell().asSlice(), sl4:null,
            bu3:beginCell(), bu4:null
        };
    }
}