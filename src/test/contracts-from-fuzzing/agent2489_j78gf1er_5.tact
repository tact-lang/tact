struct OptionalNestedStruct {
    field: InnerOpt?;
}

struct InnerOpt {
    innerField: Int?;
}

contract TestContract {
    data: OptionalNestedStruct;

    init() {
        self.data = OptionalNestedStruct{
            field: InnerOpt{
                innerField: 42
            }
        };
    }
}
