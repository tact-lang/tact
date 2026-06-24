struct WithOptionals {
    optBool: Bool?;
    optInt: Int?;
}

contract OptPersistent {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{ optBool: null, optInt: 123 };
    }
}
