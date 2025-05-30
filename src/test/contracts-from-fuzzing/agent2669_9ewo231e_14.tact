struct Rec1 {
    f1: Int;
}

struct Rec2 {
    f2: Rec1;
    opt: Rec1?;
}

struct Rec3 {
    f3: Rec2;
}

contract OptionalMidNested {
    rec3: Rec3;

    init() {
        self.rec3 = Rec3{
            f3: Rec2{
                f2: Rec1{ f1: 1 },
                opt: null,
            },
        };
    }
}
