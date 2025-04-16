struct OptContainer {
    nest1: Int?;
    nest2: Bool?;
    nest3: Address?;
}

contract OptChainAssign {
    o1: OptContainer?;
    o2: OptContainer?;

    init() {
        self.o1 = null;
        self.o2 = OptContainer {
            nest1: null,
            nest2: null,
            nest3: null
        };
    }
}
