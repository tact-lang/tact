struct ContactInfo {
    email: String;
    phone: String?;
}

struct UserDetails {
    name: String;
    contact: ContactInfo;
    verified: Bool;
}

struct UserContainer {
    details: UserDetails;
    reputation: Int;
}

contract ThreeLevelNested {
    data: UserContainer;
    init() {
        self.data = UserContainer{
            details: UserDetails{
                name: "",
                contact: ContactInfo{
                    email: "",
                    phone: null,
                },
                verified: false
            },
            reputation: 0
        };
    }
}