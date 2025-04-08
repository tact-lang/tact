struct OptionalStructField {
    v: Int;
}

struct OuterOpt {
    inside: OptionalStructField?;
}

contract OptStructFieldTest {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            inside: OptionalStructField{ v: 42 }
        };
    }
}