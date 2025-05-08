struct WithOptionals {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
    maybeAddress: Address?;
}

contract OptionalUsage {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            maybeInt: null,
            maybeBool: null,
            maybeString: null,
            maybeAddress: null
        };
    }
}