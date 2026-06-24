struct DeepOptional {
    optField: OptionalStruct?;
}

struct OptionalStruct {
    flag: Bool;
    number: Int?;
}

contract OptionalTest {
    value: DeepOptional;

    init() {
        self.value = DeepOptional{
            optField: OptionalStruct{
                flag: true,
                number: null,
            },
        };
    }
}
