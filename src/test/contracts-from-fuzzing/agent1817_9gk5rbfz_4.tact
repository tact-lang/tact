struct OptionalNested {
    innerOpt: Int?;
    anotherFlag: Bool;
}

struct MidLevel {
    optNested: OptionalNested?;
    value: Int;
}

contract OptionalNestedTest {
    mid: MidLevel;

    init() {
        self.mid = MidLevel{
            optNested: null,
            value: 10,
        };
    }
}
