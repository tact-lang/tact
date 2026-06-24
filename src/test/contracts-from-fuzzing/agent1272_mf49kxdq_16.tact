struct CombNested {
    s1: Int;
    s2: Bool;
    s3: CombNestedInner;
    opt: CombNestedInner?;
}

struct CombNestedInner {
    i1: Int;
    i2: Bool?;
}

contract ComboNestContract {
    val: CombNested;

    init() {
        self.val = CombNested{
            s1: 5,
            s2: true,
            s3: CombNestedInner{
                i1: 7,
                i2: null
            },
            opt: null
        };
    }
}