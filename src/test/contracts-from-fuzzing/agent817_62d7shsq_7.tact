struct OptionalStruct {
    field1: Int;
    field2: Bool;
    nested: InnerStruct?;
}

struct InnerStruct {
    name: String;
    flag: Bool?;
}

contract OptStructTest {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{
            field1: 5,
            field2: true,
            nested: InnerStruct{
                name: "hi",
                flag: null,
            },
        };
    }
}