struct Rec1 {
    x: Int;
}

struct Rec2 {
    rec1: Rec1;
    y: Bool;
}

struct Rec3 {
    rec2: Rec2;
    name: String;
}

contract Test {
    data: Rec3;

    init() {
        self.data = Rec3{
            rec2: Rec2{
                rec1: Rec1{
                    x: 5,
                },
                y: true,
            },
            name: "Deep",
        };
    }
}
