// Struct with address optional and nested inside contract
struct AddrWrap {
    addr: Address?;
}

contract OptionalAddress {
    a: AddrWrap;
    init() {
        self.a = AddrWrap{ addr: null };
    }
}