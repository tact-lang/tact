struct Rec1 {
    a: Int;
}

struct Rec2 {
    a: Int;
    r: Rec1;
}

struct Rec3 {
    a: Int;
    r: Rec2;
}

contract LongPath {
    path: Rec3;

    init() {
        self.path = Rec3{
            a: 1,
            r: Rec2{
                a: 2,
                r: Rec1{
                    a: 3
                }
            }
        };
    }
}