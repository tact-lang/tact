struct SOptionalAddr {
    addr: Address?;
}

contract StructOptAddrField {
    s: SOptionalAddr;

    init() {
        self.s = SOptionalAddr{ addr: null };
    }
}