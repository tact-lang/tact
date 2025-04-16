struct OptionalDeep {
    nested: Nested?;
}

struct Nested {
    val: Int;
    flag: Bool;
}

contract TestOptDeep {
    dat: OptionalDeep;
    init() {
        self.dat = OptionalDeep{nested: null};
    }
}
