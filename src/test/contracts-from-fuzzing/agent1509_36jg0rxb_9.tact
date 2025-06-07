struct PartialDefaults {
    a: Int;
    b: Int = 5;
    c: Bool;
    d: String = "hi";
}

contract WithPartialDefaults {
    s: PartialDefaults;

    init() {
        self.s = PartialDefaults{
            a: 1,
            c: true,
        };
    }
}