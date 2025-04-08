struct HasAddress {
    a: Address;
    opt: Address?;
}

contract StructAddressTest {
    val: HasAddress;

    init() {
        self.val = HasAddress{ a: myAddress(), opt: null };
    }
}