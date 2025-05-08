struct UserData {
    name: String?;
    age: Int?;
}

contract TestContract {
    user: UserData?;

    init() {
        self.user = UserData{
            name: "Alice",
            age: 25
        };
    }
}