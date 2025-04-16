struct OptionalVariant {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

struct ComplexOptionalEmbed {
    opt1: OptionalVariant?;
    opt2: OptionalVariant?;
}

contract OptionalsInsideOptionals {
    storage: ComplexOptionalEmbed;

    init() {
        self.storage = ComplexOptionalEmbed{
            opt1: null,
            opt2: OptionalVariant{
                maybeInt: 7,
                maybeBool: null,
                maybeString: "opt"
            }
        };
    }
}
