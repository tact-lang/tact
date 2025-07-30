struct AltDefaults {
    a: Int = 5;
    b: String = "default";
    c: Bool = true;
}

contract ChangeDefaults {
    s: AltDefaults;

    init() {
        self.s = AltDefaults{ a:10, b:"changed", c:false };
    }
}