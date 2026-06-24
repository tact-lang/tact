struct OptionalStruct {
    inner: Nested?;
}

struct Nested {
    value: Int?;
    flag: Bool?;
}

contract OptionalOptional {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            inner: null
        };
    }
}