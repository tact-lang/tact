struct NestedOpt {
    sub1: String?;
    sub2: Bool?;
    sub3: Int?;
}

struct BigOpt {
    a: NestedOpt?;
    b: NestedOpt?;
}

contract DoubleOpt {
    val: BigOpt;

    init() {
        self.val = BigOpt{
            a: null,
            b: NestedOpt{ sub1:null, sub2:null, sub3:null }
        };
    }
}