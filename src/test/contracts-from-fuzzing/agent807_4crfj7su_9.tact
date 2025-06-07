struct LargeNested {
    aa: Int;
    bb: Bool;
    cc: String;
    dd: Int?;
    ee: Bool?;
}

struct HighLevel {
    n1: LargeNested;
    n2: LargeNested;
}

contract BigNestedContract {
    val: HighLevel;
    init() {
        self.val = HighLevel{
            n1: LargeNested{ aa:1, bb:true, cc:"x", dd:null, ee:null },
            n2: LargeNested{ aa:2, bb:false, cc:"y", dd:4, ee:true },
        };
    }
}