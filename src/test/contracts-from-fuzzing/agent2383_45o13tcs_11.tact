struct Mid {
    flag: Bool;
    comment: String;
    optInt: Int?;
}

struct OuterStruct {
    mid: Mid;
    flag2: Bool;
}

contract MiddleObj {
    param: OuterStruct;
    init() {
        self.param = OuterStruct{
            mid: Mid{ flag: true, comment: "ok", optInt: null },
            flag2: false
        };
    }
}