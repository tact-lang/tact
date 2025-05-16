struct NullableAddr {
    a: Address?;
}

contract NullableAddrContract {
    addr: NullableAddr;

    init() {
        self.addr = NullableAddr{
            a: null,
        };
    }
}