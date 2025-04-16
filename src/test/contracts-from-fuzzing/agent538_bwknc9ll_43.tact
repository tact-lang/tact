struct Strange {
    a: Int = 7;
    b: Bool;
}

contract PartialDefaults {
    s: Strange;

    init() {
        self.s = Strange{b:true};
    }
}