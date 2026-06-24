struct Rec1 {
    id: Int;
}

struct Rec2 {
    id: Int;
}

struct Rec3 {
    id: Int;
}

contract MultiStructs {
    r1: Rec1;
    r2: Rec2;
    r3: Rec3;
    init() {
        self.r1 = Rec1{id:1};
        self.r2 = Rec2{id:2};
        self.r3 = Rec3{id:3};
    }
}