struct OptionalAddrStruct {
    addr: Address?;
}

contract OptAddr {
    f: OptionalAddrStruct;

    init() {
        self.f = OptionalAddrStruct{ addr: null };
    }
}