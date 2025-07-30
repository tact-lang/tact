struct PhoneBook {
    name: String;
    phone: String;
}

contract StructString {
    entry: PhoneBook;

    init() {
        self.entry = PhoneBook{ name: "Boss", phone: "+1234" };
    }
}