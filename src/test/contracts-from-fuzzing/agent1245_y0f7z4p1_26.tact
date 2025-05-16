struct SNested {
    foo: Int;
    bar: String?;
    baz: Bool;
}

contract ComboNesting {
    s1: SNested;
    optS2: SNested?;
    flag: Bool;

    init() {
        self.s1 = SNested { foo: 99, bar: null, baz: true };
        self.optS2 = null;
        self.flag = false;
    }
}
