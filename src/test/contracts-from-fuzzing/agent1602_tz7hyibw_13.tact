struct StructOne {
    v1: Int;
    v2: Bool;
}

struct StructTwo {
    s1: StructOne;
    s2: StructOne;
}

contract StructCombination {
    comb: StructTwo;

    init() {
        self.comb = StructTwo{
            s1: StructOne{v1:1,v2:true},
            s2: StructOne{v1:2,v2:false},
        };
    }
}
