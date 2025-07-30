contract NestedOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address;

    init() {
        self.a = 4;
        self.b = null;
        self.c = "hi";
        self.d = myAddress();
    }
}