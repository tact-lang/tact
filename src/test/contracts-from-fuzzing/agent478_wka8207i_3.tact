struct AddressName {
    addr: Address;
    name: String;
}

contract TestContract {
    rec: AddressName?;  // optional struct persistent variable, default null

    init() {
        self.rec = AddressName{
            addr: myAddress(),
            name: "test"
        };
    }
}
