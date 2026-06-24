struct OptionalAddr {
    addr: Address?;
    val: Int;
}

contract OptionalAddressPersist {
    data: OptionalAddr;
    init() {
        self.data = OptionalAddr{ addr:null, val:7 };
    }
}