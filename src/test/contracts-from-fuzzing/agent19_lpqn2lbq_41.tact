struct NestedManyLevels {
    a: Int?;
    b: Bool;
}

struct OuterMost {
    f1: NestedManyLevels;
    f2: NestedManyLevels;
    f3: NestedManyLevels;
}

contract TestContract {
    om: OuterMost;

    init() {
        self.om = OuterMost{
            f1: NestedManyLevels{a:null,b:true},
            f2: NestedManyLevels{a:null,b:false},
            f3: NestedManyLevels{a:42,b:true},
        };
    }
}