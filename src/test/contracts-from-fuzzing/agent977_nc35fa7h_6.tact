// test optional fields combined with nested struct fields
struct Profile {
    name: String;
    age: Int?;
    country: String?;
    note: String;
}

contract UserProfileData {
    profile: Profile;
    init() {
        self.profile = Profile{
            name: "Alice",
            age: null,
            country: null,
            note: "test"
        };
    }
}