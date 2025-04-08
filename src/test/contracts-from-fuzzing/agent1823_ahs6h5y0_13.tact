struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool;
}

contract BoolsDefaults {
    bfields: BoolDefaults;

    init() {
        self.bfields = BoolDefaults{
            a: false,
            b: true,
            c: true
        };
    }
}