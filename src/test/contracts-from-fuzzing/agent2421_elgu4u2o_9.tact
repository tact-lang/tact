struct StructCOpt {
    x: Int;
    addr: Address?;
}

contract ContractOptAddr {
    storage: StructCOpt;

    init() {
        self.storage = StructCOpt{
            x: 7,
            addr: null
        };
    }
}