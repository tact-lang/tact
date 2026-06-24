// test unusual ordering
struct StrangeOrder {
    s: String;
    flag: Bool;
    data: Int;
    optStr: String?;
    moreData: Int;
    optInt: Int?;
}

contract WeirdOrder {
    f: StrangeOrder;

    init() {
        self.f = StrangeOrder{
            s:"s",
            flag:true,
            data:1,
            optStr:null,
            moreData:2,
            optInt:null
        };
    }
}