struct Profile {
    name: String;
    age: Int;
}

contract OptStructField {
    profile: Profile? = null;

    init() {
        self.profile = Profile{
            name: "Alice",
            age: 30,
        };
    }
}