struct OptionalFull {
    nested: InnerOpt?;
}

struct InnerOpt {
    intopt: Int?;
}

contract OptionalFullDeep {
    o: OptionalFull;
    init() {
        self.o = OptionalFull { nested: null };
    }
}