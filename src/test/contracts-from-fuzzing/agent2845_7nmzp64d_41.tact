struct Rec1 {
    v: Int;
}

struct Rec2 {
    nested: Rec1;
}

struct Rec3 {
    nested: Rec2;
}

contract DeepRecursion {
    val: Rec3;

    init() {
        self.val = Rec3{
            nested: Rec2{
                nested: Rec1{
                    v: 123
                }
            }
        };
    }
}