struct BoolLayer {
    f1: Bool;
    f2: Bool;
}

struct BoolNest {
    l1: BoolLayer;
    l2: BoolLayer;
}

contract DoublyNestedBool {
    data: BoolNest;

    init() {
        self.data = BoolNest{
            l1: BoolLayer{f1:true,f2:false},
            l2: BoolLayer{f1:false,f2:true}
        };
    }
}