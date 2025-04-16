contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address;

    init() {
        self.d = myAddress();
    }
}