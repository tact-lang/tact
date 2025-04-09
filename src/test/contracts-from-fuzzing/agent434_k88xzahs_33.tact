struct PartialDefaults {
    i1: Int;
    i2: Int = 0;
    i3: Int;
    b: Bool = true;
}

contract Test {
    s: PartialDefaults;

    init() {
        self.s = PartialDefaults{
            i1:123,
            i3:456
        };
    }
}