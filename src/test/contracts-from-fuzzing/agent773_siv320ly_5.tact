struct IntAndOptional {
    n: Int;
    maybe: Bool?;
}

contract OptionalAndInt {
    s: IntAndOptional;

    init() {
        self.s = IntAndOptional{
            n: 1,
            maybe: null,
        };
    }
}