struct WithOptional {
    maybeInt: Int?;
    flag: Bool;
}

contract OptionalStructHolder {
    data: WithOptional;

    init() {
        self.data = WithOptional{
            maybeInt: null,
            flag: true
        };
    }
}