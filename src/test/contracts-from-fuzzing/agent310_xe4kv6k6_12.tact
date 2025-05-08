struct DeepOptional {
    innerOpt: Int?;
}

struct OptionalOfStruct {
    opt: DeepOptional?;
}

contract OptionalStructFieldTest {
    data: OptionalOfStruct;

    init() {
        self.data = OptionalOfStruct{
            opt: null
        };
    }
}