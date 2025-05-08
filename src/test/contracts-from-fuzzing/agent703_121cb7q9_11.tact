struct User {
    name: String = "Satoshi";
    age: Int?;
    active: Bool = true;
}

contract TestContract {
    user: User;

    init() {
        self.user = User{
            age: null
        };
    }
}