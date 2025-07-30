struct OptionalStructs {
    optS1: Inner?;
    optS2: Another?;
}

struct Inner {
    value: Int;
}

struct Another {
    flag: Bool;
}

contract OptStructs {
    data: OptionalStructs;

    init() {
        self.data = OptionalStructs{
            optS1: null,
            optS2: null
        };
    }
}