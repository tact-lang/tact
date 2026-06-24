struct NullableAddress {
    addr: Address?;
}

contract OptionalAddress {
    a: NullableAddress;
    init() {
        self.a = NullableAddress{ addr: null };
    }
}
