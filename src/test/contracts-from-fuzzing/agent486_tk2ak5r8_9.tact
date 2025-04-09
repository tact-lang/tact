struct BoolNest {
    nested: BoolNestedInner;
}

struct BoolNestedInner {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    deeper: DeeperLevel;
}

struct DeeperLevel {
    flag: Bool;
}

contract TestBoolNest {
    data: BoolNest;

    init() {
        self.data = BoolNest{
            nested: BoolNestedInner{
                b1:true,b2:true,b3:false,
                deeper: DeeperLevel{ flag: true }
            }
        };
    }
}