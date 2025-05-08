struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = false;
    e: String = "x";
    f: String = "y";
    g: String = "z";
}

contract WithManyDefaults {
    s: ManyDefaults;
    init() {
        self.s = ManyDefaults{
            a:10, b:20, c:30, d:true, e:"E", f:"F", g:"G"
        };
    }
}
