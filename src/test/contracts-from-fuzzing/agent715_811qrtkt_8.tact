struct Rec1 {
    val1: Int;
}

struct Rec2 {
    inner: Rec1;
}

struct Rec3 {
    nested: Rec2;
}

contract RecDeep {
    f: Rec3;
    init() {
        self.f = Rec3{
            nested: Rec2{
                inner: Rec1{ val1: 11 }
            }
        };
    }
}