struct LargeNested {
    x1: Int;
    x2: String;
    x3: Bool;
    x4: Int?;
    x5: String?;
    x6: Bool?;
    x7: Int;
    x8: String;
    x9: Bool;
    sub: NestedSub;
}

struct NestedSub {
    y1: Int;
    y2: String;
    y3: Bool?;
}

contract VeryBig {
    val: LargeNested;

    init() {
        self.val = LargeNested{
            x1:1,x2:"a",x3:true,x4:null,x5:"b",x6:null,x7:7,x8:"c",x9:false,
            sub: NestedSub{ y1:42, y2:"foo", y3:true },
        };
    }
}