struct OptionalsTop {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
}

struct OptionalsMid {
    top: OptionalsTop?;
    middle: Int;
}

contract ManyNestedOptionals {
    data: OptionalsMid;

    init() {
        self.data = OptionalsMid{
            top: null,
            middle: 42
        };
    }
}