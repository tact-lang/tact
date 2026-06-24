struct OptS {
    f: Int?;
}

contract NullDefaultOpt {
    o: OptS;

    init() {
        self.o = OptS{ f: null };
    }
}
