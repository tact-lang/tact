struct Rec1 {
    f1: Rec2;
}

struct Rec2 {
    f2: Rec3;
}

struct Rec3 {
    value: Int;
}

contract Deep3Nested {
    r: Rec1;

    init() {
        self.r = Rec1{
            f1: Rec2{
                f2: Rec3{value: 42}
            }
        };
    }
}
