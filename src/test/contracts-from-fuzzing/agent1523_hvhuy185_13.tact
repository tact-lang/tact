struct Rec1 { f: Int }
struct Rec2 { f: Int }
struct Rec3 { f: Int }
struct Rec4 { f: Int }
struct Rec5 { f: Int }

struct Deep {
    r1: Rec1;
    r2: Rec2;
    r3: Rec3;
    r4: Rec4;
    r5: Rec5;
    optR1: Rec1?;
    optR2: Rec2?;
    optR3: Rec3?;
    optR4: Rec4?;
    optR5: Rec5?;
}

contract TestContract {
    d: Deep;

    init() {
        self.d = Deep{
            r1:Rec1{f:1}, r2:Rec2{f:2}, r3:Rec3{f:3}, r4:Rec4{f:4}, r5:Rec5{f:5},
            optR1:null,optR2:null,optR3:null,optR4:null,optR5:null
        };
    }
}