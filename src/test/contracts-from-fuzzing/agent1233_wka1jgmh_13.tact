struct Rec1 {
    val1: Int;
}

struct Rec2 {
    rec: Rec1;
    val2: String;
}

struct Rec3 {
    rec2: Rec2;
    opt: Bool?;
}

contract RecursiveStyleDeep {
    r3: Rec3;

    init() {
        self.r3 = Rec3{
            rec2: Rec2{
                rec: Rec1{val1: 99},
                val2: "hi"
            },
            opt: true
        };
    }
}