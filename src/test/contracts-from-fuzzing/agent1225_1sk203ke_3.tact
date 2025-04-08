struct DeepNestedStruct {
    coord: InnerStruct;
}

struct InnerStruct {
    left: Int;
    right: Int?;
}

contract DeepNestedOptional {
    field: DeepNestedStruct;

    init() {
        self.field = DeepNestedStruct{
            coord: InnerStruct{
                left: 5,
                right: null
            }
        };
    }
}