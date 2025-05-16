struct Rec1 {
    id: Int;
    nested: Rec2;
}

struct Rec2 {
    flag: Bool;
    nested: Rec3;
}

struct Rec3 {
    msg: String;
}

contract ThreeLevels {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            id: 123,
            nested: Rec2{
                flag: true,
                nested: Rec3{
                    msg: "deep",
                }
            }
        };
    }
}