struct BoolNest {
    b1: Bool;
    nested: BoolNest2;
}

struct BoolNest2 {
    b2: Bool;
    superNested: BoolNest3;
}

struct BoolNest3 {
    b3: Bool;
}

contract BoolNestContract {
    data: BoolNest;
    init() {
        self.data = BoolNest{
            b1: true,
            nested: BoolNest2{
                b2: false,
                superNested: BoolNest3{
                    b3: true
                }
            }
        };
    }
}