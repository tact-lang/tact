struct ContactInfo {
    name: String?;
    wallet: Address?;
}

contract TestContract {
    info: ContactInfo;

    init() {
        self.info = ContactInfo{
            name: "Alice",
            wallet: null,
        };
    }
}