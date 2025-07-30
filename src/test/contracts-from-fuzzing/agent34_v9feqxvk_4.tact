struct WithOptionals {
    optInt: Int?;
    optBool: Bool?;
}

contract OptionalFields {
    state: WithOptionals;

    init() {
        self.state = WithOptionals{
            optInt: null,
            optBool: true
        };
    }
}