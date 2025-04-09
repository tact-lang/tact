struct User {
    nickname: String?;
    wallet: Address;
}

contract TestContract {
    myUser: User;

    init() {
        self.myUser = User{ nickname: null, wallet: myAddress() };
    }
}