contract MixedOptionalPrimitives {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
    d: Int? = 0;
    e: Bool? = false;
    f: String? = "";
    g: Int = 1;
    receive() {
        let _ = self.g;
    }
}