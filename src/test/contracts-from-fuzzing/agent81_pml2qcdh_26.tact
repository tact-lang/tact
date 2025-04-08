contract OptAddrTest {
    f1: Address?;
    f2: Address?;

    init() {
        self.f1 = myAddress();
        self.f2 = null;
    }
}
