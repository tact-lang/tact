struct BoolLayer {
    b1: Bool;
    b2: Bool;
}

struct NestedBools {
    l1: BoolLayer;
    l2: BoolLayer;
}

contract NestedBoolsContract {
    data: NestedBools;

    init() {
        self.data = NestedBools{
            l1: BoolLayer{ b1:true, b2:false },
            l2: BoolLayer{ b1:false, b2:true }
        };
    }
}