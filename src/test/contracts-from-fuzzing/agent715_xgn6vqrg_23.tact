struct NestedAddresses {
    primary: Address;
    fallback: Address?;
}

struct UserData {
    id: Int;
    username: String;
    contact: NestedAddresses;
}

contract TestContract {
    user: UserData;

    init() {
        self.user = UserData{
            id: 7,
            username: "bob",
            contact: NestedAddresses{
                primary: myAddress(),
                fallback: null
            }
        };
    }
}