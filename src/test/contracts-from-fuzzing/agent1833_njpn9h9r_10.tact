struct Profile {
    nickname: String?;
    age: Int?;
}

struct Account {
    id: Int;
    profile: Profile;
    notes: String?;
}

contract MultiLayerNullable {
    data: Account;
    init() {
        self.data = Account{
            id: 1,
            profile: Profile{ nickname: null, age: null },
            notes: null
        };
    }
}
