struct AddressInfo {
    addr: Address?;
    label: String?;
}

struct User {
    name: String;
    info: AddressInfo?;
}

contract Test {
    user: User?;
    init() {
        self.user = null;
    }
}