struct BoolNest {
    aa: Bool;
    bb: Nested;
}

struct Nested {
    inner1: Bool;
    inner2: Bool;
}

contract TestContract {
    storage: BoolNest;

    init() {
        self.storage = BoolNest{
            aa: true,
            bb: Nested{
                inner1: false,
                inner2: true
            }
        };
    }
}