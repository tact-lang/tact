struct ContactInfo {
    email: String;
    phone: String?;
}

contract TestContract {
    ownerName: String = "Alice";
    contact: ContactInfo = ContactInfo{ email: "alice@example.com" };

    init() {
        self.ownerName = "Bob";
        self.contact = ContactInfo{ email: "bob@example.com", phone: null };
    }
}
