struct OptionalNested {
    nestedField: OptionalStruct?;
}

struct OptionalStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
}

contract TestOptNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nestedField: OptionalStruct{
                inner: InnerStruct{
                    val: 7
                }
            }
        };
    }
}