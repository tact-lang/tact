struct OptionalStruct {
    nested: Inner?;
}

struct Inner {
    value: Int;
}

contract OptionalStructField {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            nested: null
        };
    }
}