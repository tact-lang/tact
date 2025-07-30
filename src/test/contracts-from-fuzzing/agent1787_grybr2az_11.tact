struct WithOptionalString {
    name: String?;
    flag: Bool;
}

contract OptionalStringTest {
    profile: WithOptionalString;

    init() {
        self.profile = WithOptionalString{
            name: null,
            flag: false
        };
    }
}