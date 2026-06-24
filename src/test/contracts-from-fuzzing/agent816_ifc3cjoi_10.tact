struct SOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract ContOptStruct {
    s: SOpt;

    init() {
        self.s = SOpt { foo: null, bar: true, baz: null };
    }
}