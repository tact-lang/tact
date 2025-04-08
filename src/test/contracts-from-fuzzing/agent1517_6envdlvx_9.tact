struct Profile {
    name: String;
    age: Int?;
}

contract OptionalStructField {
    user: Profile;
    init() {
        self.user = Profile{ name: "Satoshi", age: null };
    }
}