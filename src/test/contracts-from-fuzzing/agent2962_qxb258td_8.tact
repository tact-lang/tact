struct OptRefs {
    name: String?;
    addr: Address?;
}

contract OptionalRefs {
    data: OptRefs;

    init() {
        self.data = OptRefs{
            name: null,
            addr: null
        };
    }
}