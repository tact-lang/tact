contract ConstTest {
    a: Int = 1;
    b: Address;

    init() {
        self.b = myAddress();
    }
}