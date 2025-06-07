struct AddressInfo {
    city: String = "N/A";
    zip: Int? = null;
}

struct UserProfile {
    username: String = "guest";
    email: String? = null;
    address: AddressInfo;
}

contract DeepOptionalNested {
    profile: UserProfile? = null;

    init() {
        self.profile = UserProfile{
            username: "Bob",
            email: "bob@ton.org",
            address: AddressInfo{ city: "Paris", zip: 75000 }
        };
    }
}