struct Profile {
    age: Int;
    nickname: String;
}

struct User {
    id: Int;
    profile: Profile;
}

contract TestContract {
    user: User = User{ id: 1, profile: Profile{ age: 30, nickname: "Al" } };

    init() {
        self.user = User{ id: 2, profile: Profile{ age: 20, nickname: "Bob" } };
    }
}
