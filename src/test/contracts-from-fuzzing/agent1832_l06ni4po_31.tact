struct WrappedAddress {
    addr: Address;
    note: String?;
}

contract WrapAddrStorage {
    val: WrappedAddress;

    init() {
        self.val = WrappedAddress{
            addr: myAddress(),
            note: null
        };
    }
}
