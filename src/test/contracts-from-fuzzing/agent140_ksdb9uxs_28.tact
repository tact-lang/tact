struct OptOptStruct {
    s: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract DoubleNestedOpts {
    ds: OptOptStruct;

    init() {
        self.ds = OptOptStruct{
            s: InnerOpt{ foo:null, bar:null }
        };
    }
}