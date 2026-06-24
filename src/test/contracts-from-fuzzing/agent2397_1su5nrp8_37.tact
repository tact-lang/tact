contract DefaultsInit {
    foo: Int = 7;
    bar: Bool = false;
    baz: String = "abc";
    qux: Address;
    init() {
        self.qux = myAddress();
    }
    receive() {}
}