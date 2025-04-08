struct Rec1 {
    num: Int;
    optB: Bool?;
    txt: String;
}

struct Rec2 {
    r1: Rec1;
    optAddr: Address?;
}

struct Rec3 {
    r2: Rec2;
    optSlice: Slice?;
}

contract Test12 {
    r3: Rec3;
    init() {
        self.r3 = Rec3{
            r2: Rec2{
                r1: Rec1{num:42,optB:null,txt:"abc"},
                optAddr:null
            },
            optSlice:null
        };
    }
}