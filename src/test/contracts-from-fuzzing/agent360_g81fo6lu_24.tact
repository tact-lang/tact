struct SubS {
    foo: Int;
}

contract TestContract {
    s1: SubS;
    o: SubS?;

    init() {
        self.s1 = SubS{ foo: 11 };
        self.o = null;
    }
}