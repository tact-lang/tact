struct OptsInOpts {
    a: Int?;
    b: Bool?;
    deep: DeepOpt?;
}

struct DeepOpt {
    foo: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    bar: Bool?;
}

contract ComboOpt {
    data: OptsInOpts;

    init() {
        self.data = OptsInOpts{
            a:null,
            b:null,
            deep:null
        };
    }
}