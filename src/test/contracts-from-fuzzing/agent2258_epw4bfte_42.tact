contract BulkyMixedFix {
    i1: Int = 1;
    i2: Int = 2;
    b1: Bool = true;
    b2: Bool = false;
    s1: String = "a";
    s2: String = "b";
    ai: Int? = null;
    ab: Bool? = null;
    receive() {
        let _ = self.ab;
    }
}