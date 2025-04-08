struct Rec1 {
    a: Rec2?;
}

struct Rec2 {
    b: Rec3?;
}

struct Rec3 {
    x: Int;
}

contract OptionalDeep {
    data: Rec1;

    init() {
        self.data = Rec1 {
            a: Rec2{
                b: Rec3{
                    x: 5
                }
            }
        };
    }
}