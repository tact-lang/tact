struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterWrap {
    inner1: InnerOpt;
    inner2: InnerOpt?;
    note: String;
    flag: Bool;
}

contract NestedOptionStructs {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            inner1: InnerOpt{ a:null, b:null },
            inner2: null,
            note: "hi",
            flag: true,
        };
    }
}
