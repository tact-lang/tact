struct Rec1 {
    f1: Int;
    f2: String;
}

struct Rec2 {
    g1: String;
    g2: Rec1;
}

struct Rec3 {
    h1: Rec2;
    h2: Int;
}

contract RecNested {
    data: Rec3;

    init() {
        self.data = Rec3{
            h1: Rec2{
                g1: "G",
                g2: Rec1{
                    f1: 1,
                    f2: "F"
                }
            },
            h2: 5
        };
    }
}
