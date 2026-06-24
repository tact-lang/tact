struct Rec1 {
    one: Int;
    two: Int;
}

struct Rec2 {
    rec1: Rec1;
    three: Bool;
}

struct Rec3 {
    rec2: Rec2;
    str: String;
}

contract MultiNested {
    d: Rec3;

    init() {
        self.d = Rec3{
            rec2: Rec2{
                rec1: Rec1{ one:1, two:2 },
                three:true
            },
            str: "test"
        };
    }
}