struct SOpt {
    foo: Int?;
}

contract InitNullStruct {
    s: SOpt;

    init() {
        self.s = SOpt{ foo: null };
    }
}
