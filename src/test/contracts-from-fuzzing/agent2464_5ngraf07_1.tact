contract DeeplyNestedOptional {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            inner: InnerStruct{
                maybeVal: null
            }
        };
    }
}

struct OuterStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    maybeVal: Int?;
}
