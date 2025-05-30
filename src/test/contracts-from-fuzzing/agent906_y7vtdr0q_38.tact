struct Rec1 {
    val: Int;
}

struct Rec2 {
    r1: Rec1;
}

struct Rec3 {
    r2: Rec2;
}

contract RecursiveStructs {
    data: Rec3;

    init() {
        self.data = Rec3{
            r2: Rec2{
                r1: Rec1{
                    val: 42,
                },
            },
        };
    }
}