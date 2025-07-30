struct Contact {
    name: String?;
    addr: Address?;
}

contract ContactBook {
    record: Contact;

    init() {
        self.record = Contact{ name: null, addr: null };
    }
}