struct Contacts {
    name: String;
    email: String;
    location: String;
    mainAddr: Address;
    backupAddr: Address;
}

contract TestContract {
    contacts: Contacts;

    init() {
        self.contacts = Contacts{
            name: "Alice",
            email: "a@b.c",
            location: "Wonderland",
            mainAddr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            backupAddr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }

    receive() {
        self.contacts = Contacts{
            name: "Bob",
            email: "x@y.z",
            location: "Labyrinth",
            mainAddr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            backupAddr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }
}