struct NestedOptionalStruct {
    nestedOpt: Inner?;
}

struct Inner {
    valOpt: Int?;
    flag: Bool;
}

contract DeepOpts {
    n: NestedOptionalStruct;

    init() {
        self.n = NestedOptionalStruct{
            nestedOpt: Inner{ valOpt:null, flag:true }
        };
    }
}