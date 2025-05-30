struct Strange {
    foo: Int?;
    bar: Bool?;
}

contract NullCrazy {
    s: Strange;

    init() {
        self.s = Strange{ foo:null, bar:null };
    }
}