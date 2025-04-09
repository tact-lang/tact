struct ContactInfo {
    phone: String?;
    email: String?;
}

struct UserProfile {
    name: String;
    age: Int?;
    contact: ContactInfo;
}

contract ComplexContacts {
    user: UserProfile;

    init() {
        self.user = UserProfile{
            name: "Satoshi",
            age: null,
            contact: ContactInfo{
                phone: null,
                email: "satoshi@example.com",
            }
        };
    }
}