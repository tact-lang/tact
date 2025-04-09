struct BoolNest {
    flag1: Bool;
    flag2: Bool?;
}

struct ContainsBoolNest {
    nested: BoolNest;
    nestedOpt: BoolNest?;
}

contract BoolTest {
    meta: ContainsBoolNest;

    init() {
        self.meta = ContainsBoolNest{
            nested: BoolNest{ flag1:true, flag2:null },
            nestedOpt: null
        };
    }
}