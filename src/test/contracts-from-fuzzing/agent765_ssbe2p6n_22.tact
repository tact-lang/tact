struct NestedOptionalStruct {
    inner: InnerOptional?;
}

struct InnerOptional {
    nestedInner: InnerMost?;
    flag: Bool;
}

struct InnerMost {
    data: Int;
}

contract NestedOptionals {
    opt: NestedOptionalStruct;
    init() {
        self.opt = NestedOptionalStruct{
            inner: InnerOptional{
                nestedInner: null,
                flag: false
            }
        };
    }
}