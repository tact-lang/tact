contract Test {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    b1: Bool = true;
    b2: Bool = false;
    s1: String = "s1";
    s2: String = "s2";
    oi1: Int? = null;
    oi2: Int? = 42;
    ob1: Bool? = null;
    ob2: Bool? = true;

    init() {
        // mutate some optionals
        self.oi1 = 123;
        self.ob1 = false;
    }
}
// mixed types, multiple optionals, many fields