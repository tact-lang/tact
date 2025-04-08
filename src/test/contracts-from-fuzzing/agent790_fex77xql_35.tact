struct HasDefault {
    a: Int = 0;
    b: Int = 1;
    c: Int;
}

contract PartialDefaults {
    s: HasDefault;

    init() {
        self.s = HasDefault{c:42};
    }
}