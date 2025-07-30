struct OptionalNested {
    x: Int;
    maybeInner: InnerOpt?;
}

struct InnerOpt {
    name: String;
    boolFlag: Bool?;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            x: 1,
            maybeInner: InnerOpt {
                name: "abc",
                boolFlag: null
            }
        };
    }
}