struct NestedLong {
    inner: InnerLong;
}

struct InnerLong {
    x1: Int;
    x2: Int;
    x3: Bool;
    x4: String;
    x5: Int?;
    x6: Int as uint8;
    x7: Int as int4;
    x8: Bool?;
    x9: String?;
    x10: Int?
}

contract DeepWide {
    n: NestedLong;

    init() {
        self.n = NestedLong{
            inner: InnerLong{
                x1:1, x2:2, x3:true, x4:"hi",
                x5:null, x6:8, x7:-3,
                x8:false, x9:null, x10:10
            }
        };
    }
}