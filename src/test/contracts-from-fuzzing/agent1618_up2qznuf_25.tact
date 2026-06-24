struct AddressInfo {
    addr: Address? = null;
    active: Bool? = true;
    balance: Int?;
}

contract OptDefaults {
    info: AddressInfo;

    init() {
        self.info = AddressInfo{addr: null, active: false, balance: 1000};
    }
}