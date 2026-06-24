struct Rec1 {
    v1: Int;
}

struct Rec2 {
    v2: Rec1;
}

struct Rec3 {
    v3: Rec2;
}

contract ChainedStructs {
    x: Rec3;

    init() {
        self.x = Rec3{
            v3: Rec2{
                v2: Rec1{ v1: 123 }
            }
        };
    }
}