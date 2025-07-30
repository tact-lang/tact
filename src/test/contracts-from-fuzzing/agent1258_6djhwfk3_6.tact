struct AddressHolder {
    addr: Address;
    comment: String;
}

contract StructOfAddresses {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{
            addr: myAddress(),
            comment: "init",
        };
    }

    receive() {
        self.data = AddressHolder{
            addr: myAddress(),
            comment: "update",
        };
    }
}