struct Contact {
    addr: Address?;
    name: String;
}

contract TestContract {
    cont: Contact;

    init() {
        self.cont = Contact{
            addr: null,
            name: "Satoshi",
        };
    }
}
