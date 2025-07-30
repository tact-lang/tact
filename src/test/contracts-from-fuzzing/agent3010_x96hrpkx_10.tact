struct NestedOptStruct {
    foo: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    bar: Bool?;
}

contract NestedOptUsage {
    var1: NestedOptStruct;

    init() {
        self.var1 = NestedOptStruct{
            foo: null,
            inner: InnerOpt{ bar: null }
        };
    }
}
