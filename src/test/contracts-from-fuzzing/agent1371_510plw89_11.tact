struct User {
    name: String = "anon";
    email: String?; // default null
    bio: String?;   // default null
}

contract OptPartDefaults {
    u: User;

    init() {
        self.u = User{
            // omit email and bio
            name: "alice"
        };
    }
}
