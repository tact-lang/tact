struct Rec1 {
    next: Rec2?;
}

struct Rec2 {
    kind: Int;
}

contract RecursiveOpt {
    r: Rec1;

    init() {
        self.r = Rec1{
            next: Rec2{kind:5}
        };
    }
}