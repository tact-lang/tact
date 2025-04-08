contract MultipleFields {
    i: Int = 1;
    b: Bool = true;
    s: String = "x";
    a: Address;
    init() {
        self.a = myAddress();
    }
}