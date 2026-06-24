struct IntAndOptional {
    a: Int;
    b: Int?;
}

contract OptionalFieldDefault {
    v: IntAndOptional;

    init() {
        self.v = IntAndOptional{ a: 0, b: null };
    }
}