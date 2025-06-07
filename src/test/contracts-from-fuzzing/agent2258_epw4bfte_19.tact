contract LargeOptionalMix {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Int? = null;
    f: Bool? = null;
    g: String? = null;
    h: Address? = null;
    receive() {
        let _ = self.e;
    }
}