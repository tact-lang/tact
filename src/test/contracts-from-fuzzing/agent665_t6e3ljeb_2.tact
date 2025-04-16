struct OptionalNest {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract TestOptNested {
    nestedOpt: OptionalNest;

    init() {
        self.nestedOpt = OptionalNest{
            inner: InnerStruct{
                value: null
            }
        };
    }
}
