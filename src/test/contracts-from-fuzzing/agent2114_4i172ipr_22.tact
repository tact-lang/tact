struct WithStringOpt {
    s: String?;
}

contract OptStringField {
    data: WithStringOpt;

    init() {
        self.data = WithStringOpt {
            s: null
        };
    }
}
