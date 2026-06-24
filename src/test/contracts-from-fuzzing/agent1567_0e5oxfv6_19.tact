struct OptionalInOptional {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
}

contract TestOptOpt {
    data: OptionalInOptional;

    init() {
        self.data = OptionalInOptional{
            innerOpt: null
        };
    }
}