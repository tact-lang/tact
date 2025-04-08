struct InnerMostLarge {
    aa: Int;
    bb: Bool;
    cc: String;
}

struct MiddleLarge {
    inner: InnerMostLarge;
    msg: String;
}

struct OuterLarge {
    first: Int;
    mid: MiddleLarge;
    flag: Bool;
}

contract MultiLevelComplexStruct {
    var: OuterLarge;

    init() {
        self.var = OuterLarge{
            first: 1,
            mid: MiddleLarge{
                inner: InnerMostLarge{aa:2,bb:true,cc:"hi"},
                msg:"foo"
            },
            flag: false
        };
    }
}