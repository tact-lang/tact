struct WithOptional {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

contract TestContract {
    optStructField: WithOptional;

    init() {
        self.optStructField = WithOptional{
            maybeInt: null,
            maybeBool: null,
            maybeString: null,
        };
    }
}