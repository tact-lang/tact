contract OptionalAddressTest {
    a: Address?;
    b: Address?;
    flag: Bool;

    init() {
        self.a = null;
        self.b = myAddress();
        self.flag = true;
    }
}