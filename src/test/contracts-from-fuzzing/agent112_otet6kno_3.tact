struct WithOptionals {
    name: String = "";
    maybeVal: Int?;
    maybeString: String?;
    maybeBool: Bool?;
}

contract OptionalsInStruct {
    state: WithOptionals = WithOptionals{
        name: "abc",
        maybeVal: null,
        maybeString: null,
        maybeBool: null
    };

    init() {
        self.state = WithOptionals{
            name: "zzz",
            maybeVal: 100,
            maybeString: "hi",
            maybeBool: true
        };
    }
}
