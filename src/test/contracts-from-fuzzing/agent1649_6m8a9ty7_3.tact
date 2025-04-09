contract TestContract {
    foo: Int = 123;
    flag: Bool = true;
    note: String = "hi";
    addr: Address; // no default

    init() {
        self.addr = sender();
    }
}