struct NestedAddress {
    a: Int;
    b: Address?;
}

contract NestedAddr {
    inner: NestedAddress;

    init() {
        self.inner = NestedAddress{ a: 10, b: null };
    }
}