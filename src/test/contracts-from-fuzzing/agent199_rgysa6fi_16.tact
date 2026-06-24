struct BoolNest {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

struct ManyNestedBools {
    nest1: BoolNest;
    nest2: BoolNest;
    nest3: BoolNest;
}

contract PackedBoolsContract {
    data: ManyNestedBools;

    init() {
        self.data = ManyNestedBools{
            nest1: BoolNest{b1:true, b2:false, b3:true},
            nest2: BoolNest{b1:false, b2:true, b3:false},
            nest3: BoolNest{b1:true, b2:true, b3:true},
        };
    }
}
