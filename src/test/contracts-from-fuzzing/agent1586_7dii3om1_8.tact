struct AddressInfo {
    street: String;
    city: String;
}

struct UserProfile {
    username: String;
    address: AddressInfo;
}

contract TestContract {
    user: UserProfile;

    init() {
        self.user = UserProfile{
            username: "charlie",
            address: AddressInfo{
                street: "Main St",
                city: "Big City",
            },
        };
    }

    receive() {}
}