struct OptionalInOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    nestedOpt: Bool?;
}

contract OptInOptContract {
    data: OptionalInOptional;

    init() {
        self.data = OptionalInOptional{
            inner: InnerStruct{
                nestedOpt: null
            }
        };
    }
}