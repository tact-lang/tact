struct OptionalStruct {
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    field1: Int;
    field2: String;
    field3: Bool;
}

contract TestContract {
    optStruct: OptionalStruct;

    init() {
        self.optStruct = OptionalStruct{
            nestedOpt: InnerStruct{
                field1: 55,
                field2: "hi",
                field3: false
            }
        };
    }
}
