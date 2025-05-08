struct Mixed {
    a: Int? = null;
    b: Bool? = true;
    c: String?;
}

contract MixedDefaults {
    m: Mixed;

    init() {
        self.m = Mixed{
            c: null
        };
    }
}
