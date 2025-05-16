struct OptionalStruct {
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            nestedOpt: InnerStruct{
                value: 999
            }
        };
    }
}
