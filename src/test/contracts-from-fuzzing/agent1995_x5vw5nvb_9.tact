struct InnerStruct {
    value: Int as uint32;
    flag: Bool;
}

struct MiddleStruct {
    inner: InnerStruct;
    comment: String = "test";
}

struct TopStruct {
    middle: MiddleStruct;
    extra: String;
}

contract MultiLayer {
    record: TopStruct;
    init() {
        self.record = TopStruct{
            extra: "ok",
            middle: MiddleStruct{
                inner: InnerStruct{value:42, flag:true}
            }
        };
    }
}