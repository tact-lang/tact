struct Profile {
    name: String?;
    age: Int = 18;
    bio: String? = null;
}

struct User {
    uid: Int;
    profile: Profile?;
}

contract ComplexMixInit {
    user: User;
    init() {
        self.user = User{
            uid: 12345,
            profile: null,
        };
    }
}