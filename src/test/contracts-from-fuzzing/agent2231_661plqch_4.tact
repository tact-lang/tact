struct WithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalStructContract {
    item: WithOptionals;

    init() {
        self.item = WithOptionals{
            optInt: null,
            optBool: null,
            optStr: null,
        };
    }
}