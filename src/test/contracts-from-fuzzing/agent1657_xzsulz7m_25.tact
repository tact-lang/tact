struct Rec1 {
    f1: Int;
    f2: Rec2;
}

struct Rec2 {
    g1: Bool;
    g2: Rec3;
}

struct Rec3 {
    h1: Address;
    h2: Rec4;
}

struct Rec4 {
    i1: Slice;
    i2: Rec5;
}

struct Rec5 {
    j1: String;
    j2: Int;
}

contract TestContract {
    r: Rec1;
    init() {
        self.r = Rec1{
            f1:1,
            f2:Rec2{
                g1:true,
                g2:Rec3{
                    h1: myAddress(),
                    h2: Rec4{
                        i1: emptyCell().asSlice(),
                        i2: Rec5{j1:"deep", j2:77}
                    }
                }
            }
        };
    }
}