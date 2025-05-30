struct Rec1 {
    f1: Int;
    opt: Rec2?;
}

struct Rec2 {
    f2: Int;
    opt: Rec3?;
}

struct Rec3 {
    f3: Int;
}

contract RecursiveOptional {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            f1:1,
            opt: Rec2{
                f2:2,
                opt: Rec3{
                    f3:3
                }
            }
        };
    }
}
