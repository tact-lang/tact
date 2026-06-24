struct IntPair {
    left: Int;
    right: Int;
}

struct MixedOptional {
    flag: Bool;
    optionalPair: IntPair?;
    description: String?;
}

contract OptionalStructField {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{
            flag: true,
            optionalPair: null,
            description: null,
        };
    }

    receive() {
        self.data;
    }
}