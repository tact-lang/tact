contract JustPrimitiveDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "q";
    d: Address;

    init() {
        self.d = myAddress();
    }
}