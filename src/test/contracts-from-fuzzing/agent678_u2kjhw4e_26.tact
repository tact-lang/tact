struct AddressInfo {
    addr: Address;
    label: String?;
}

struct UserProfile {
    id: Int;
    name: String?;
    addressInfo: AddressInfo?;
}

struct UserWrapper {
    profile: UserProfile;
    isActive: Bool;
    remark: String?;
}

contract TestContract {
    user: UserWrapper;
    init() {
        self.user = UserWrapper{
            profile: UserProfile{
                id: 1,
                name: null,
                addressInfo: null
            },
            isActive: true,
            remark: null
        };
    }
}