struct AddrHolder {
    a: Address;
    b: Address?;
}

contract AddressFieldTest {
    ah: AddrHolder;

    init() {
        self.ah = AddrHolder{
            a: myAddress(),
            b: null,
        };
    }
}