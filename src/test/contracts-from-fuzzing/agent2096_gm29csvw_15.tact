struct NestedA {
    ival: Int;
}
struct NestedB {
    bval: NestedA;
}
struct NestedC {
    cval: NestedB;
}

contract MultiContractField {
    na: NestedA;
    nb: NestedB;
    nc: NestedC;

    init() {
        self.na = NestedA{ ival: 1 };
        self.nb = NestedB{ bval: NestedA{ ival: 2 } };
        self.nc = NestedC{ cval: NestedB{ bval: NestedA{ ival: 3 } } };
    }
}