struct Rec1 {
    n1: Int;
}

struct Rec2 {
    n2: Bool;
    rec1: Rec1;
}

struct Rec3 {
    n3: String;
    rec2: Rec2;
}

contract DeepRecursion {
    val: Rec3;
    init() {
        self.val = Rec3{
            n3: "deep",
            rec2: Rec2{
                n2: true,
                rec1: Rec1{n1: 999}
            }
        };
    }
}