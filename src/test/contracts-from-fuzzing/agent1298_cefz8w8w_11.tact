struct Details {
    description: String = "none";
    score: Int = 0;
}

struct Profile {
    nick: String;
    info: Details;
}

contract NestedWithDefaults {
    profile: Profile;

    init() {
        self.profile = Profile{
            nick: "anonymous",
            info: Details{}
        };
    }
}