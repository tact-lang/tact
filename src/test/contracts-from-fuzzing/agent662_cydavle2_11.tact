struct NestedOpt {
    inner: InnerOpt?;
    num: Int;
}

struct InnerOpt {
    flag: Bool;
    msg: String?;
}

contract NestedOptionalFields {
    field: NestedOpt;
    init() {
        self.field = NestedOpt {
            inner: InnerOpt { flag:true, msg:null },
            num: 5
        };
    }
}