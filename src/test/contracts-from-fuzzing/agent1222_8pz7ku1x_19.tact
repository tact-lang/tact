struct Contact {
    telegram: String?;
    discord: String?;
}

struct Profile {
    name: String = "anon";
    age: Int?;
    contact: Contact?;
}

contract TestContract {
    user: Profile;

    init() {
        self.user = Profile{
            name: "User",
            age: null,
            contact: Contact{
                telegram: "@username",
                discord: null,
            },
        };
    }

    receive() {
        let tg = self.user.contact;
    }
}