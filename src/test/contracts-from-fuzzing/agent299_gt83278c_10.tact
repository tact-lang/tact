struct User {
    username: String;
    isAdmin: Bool;
}

struct Profile {
    bio: String;
    age: Int;
}

struct Status {
    active: Bool;
    reason: String?;
}

contract TestContract {
    user: User;
    profile: Profile;
    status: Status;

    init() {
        self.user = User{
            username: "alice",
            isAdmin: true
        };
        self.profile = Profile{
            bio: "Blockchain dev",
            age: 30
        };
        self.status = Status{
            active: true,
            reason: null
        };
    }
}