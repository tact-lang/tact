struct AddressInfo {
    addr: Address;
    label: String;
}

struct UserProfile {
    name: String;
    info: AddressInfo;
}

contract TestContract {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            name: "Bob",
            info: AddressInfo{
                addr: myAddress(),
                label: "home"
            }
        };
    }
}