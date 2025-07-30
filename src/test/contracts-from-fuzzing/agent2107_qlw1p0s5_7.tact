struct Rec1 {
    a: Int;
}

struct Rec2 {
    r: Rec1;
}

struct Rec3 {
    r: Rec2;
}

contract VeryDeep {
    data: Rec3;

    init() {
        self.data = Rec3{
            r: Rec2{
                r: Rec1{
                     a: 123,
                }
            }
        };
    }
}