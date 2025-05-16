struct Profile {
    name: String = "Satoshi";
    age: Int?;
    status: Bool = true;
}

contract PartialOverrides {
    profile: Profile;
    init() {
        self.profile = Profile{
            name: "",        // override default
            age: null,        // leave null
            status: true      // keep default explicitly
        };
    }
}