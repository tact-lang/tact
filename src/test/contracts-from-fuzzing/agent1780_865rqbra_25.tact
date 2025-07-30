struct OptStrAddr {
    name: String?;
    wallet: Address?;
}

contract DoubleOptionalComplex {
    data: OptStrAddr;

    init() {
        self.data = OptStrAddr{
            name: null,
            wallet: null
        };
    }
}