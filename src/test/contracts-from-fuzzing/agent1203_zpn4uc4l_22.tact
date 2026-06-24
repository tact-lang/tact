struct Rec1 {
    b: Bool;
}

struct Rec2 {
    b: Bool;
    r1: Rec1;
}

struct Rec3 {
    b: Bool;
    r2: Rec2;
}

contract RecNested {
    nested: Rec3;
    init() {
        self.nested = Rec3{b:true, r2:Rec2{b:false, r1:Rec1{b:true}}};
    }
}