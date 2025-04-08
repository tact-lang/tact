struct OptBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract OptionalBools {
    o: OptBools;

    init() {
        self.o = OptBools{
            b1: null,
            b2: true,
            b3: null,
        };
    }
}