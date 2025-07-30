struct MixedOptionals {
    name: String;
    age: Int?;
    description: String?;
    active: Bool;
}

contract MixedOptionalsContract {
    profile: MixedOptionals;

    init() {
        self.profile = MixedOptionals{
            name: "Alice",
            age: null,
            description: null,
            active: true
        };
    }
}
