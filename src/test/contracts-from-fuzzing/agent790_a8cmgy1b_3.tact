struct AddressNested {
    addr: Address;
    flag: Bool;
}

contract NestedStructField {
    item: AddressNested;

    init() {
        self.item = AddressNested{addr: myAddress(), flag: true};
    }
}
