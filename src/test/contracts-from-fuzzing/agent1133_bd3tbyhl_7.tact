struct DeepOptional {
    innermost: Bool?;
}

struct MiddleOptional {
    mid: DeepOptional?;
    count: Int;
}

contract OptionalStructInStruct {
    value: MiddleOptional;

    init() {
        self.value = MiddleOptional{
            mid: null,
            count: 3
        };
    }
}