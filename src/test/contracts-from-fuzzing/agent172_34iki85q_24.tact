struct Details {
    bio: String?;
    photo: String?;
    rating: Int?;
}

struct Account {
    username: String;
    info: Details?;
    active: Bool;
}

contract ComplexNested {
    acct: Account;

    init() {
        self.acct = Account{
            username: "user",
            info: Details{
                bio: "some bio",
                photo: null,
                rating: null,
            },
            active: true,
        };
    }
}