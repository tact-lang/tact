struct DeepAddressNest {
    a: Address;
}

struct Wrap {
    inner: DeepAddressNest;
}

contract NestedAddr {
    val: Wrap;

    init() {
        self.val = Wrap{ inner: DeepAddressNest{ a: myAddress() } };
    }
}
