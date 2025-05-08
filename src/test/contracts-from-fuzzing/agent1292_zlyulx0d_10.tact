struct DeepOptional {
    value: Int?;
    text: String?;
}

struct Layered {
    field1: DeepOptional;
    field2: DeepOptional;
}

contract RepeatOptional {
    storage: Layered;

    init() {
        self.storage = Layered{
            field1: DeepOptional{ value: null, text: null },
            field2: DeepOptional{ value: null, text: null },
        };
    }
}