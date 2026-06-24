struct Name {
    first: String;
    last: String;
}

struct Profile {
    id: Int;
    name: Name;
    email: String;
}

struct Account {
    profile: Profile;
    active: Bool;
}

contract VeryNested {
    account: Account;

    init() {
        self.account = Account{
            profile: Profile{
                id: 77,
                name: Name{ first: "Dora", last: "Explorer" },
                email: "dora@map.com"
            },
            active: true
        };
    }

    receive() {
        let _ = self.account;
    }
}