struct AddressInfo {
    main: Address;
    backup: Address?;
}

struct UserProfile {
    id: Int;
    info: AddressInfo;
    name: String;
}

contract TestContract {
    user: UserProfile;

    init() {
        self.user = UserProfile{
            id: 1001,
            info: AddressInfo{
                main: myAddress(),
                backup: null
            },
            name: "Alice"
        };
    }
}