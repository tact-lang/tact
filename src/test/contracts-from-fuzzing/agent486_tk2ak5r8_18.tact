struct AddressOptNested {
    inner: InnerOptAddr;
}

struct InnerOptAddr {
    addr: Address?;
}

contract TestAddressOptNested {
    data: AddressOptNested;

    init() {
        self.data = AddressOptNested{
            inner: InnerOptAddr{
                addr: null
            }
        };
    }
}