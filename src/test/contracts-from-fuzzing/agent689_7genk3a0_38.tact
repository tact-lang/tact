struct OptionalAddrStruct {
    addr: Address?;
}

contract OptAddrStructStorage {
    s: OptionalAddrStruct;
    init() {
        self.s = OptionalAddrStruct{ addr: null };
    }
}