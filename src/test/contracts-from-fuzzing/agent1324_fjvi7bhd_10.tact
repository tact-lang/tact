struct AddressBook {
    contactName: String;
}

contract OptionalNestedStructField {
    abook: AddressBook?;

    init() {
        self.abook = null;
    }
}