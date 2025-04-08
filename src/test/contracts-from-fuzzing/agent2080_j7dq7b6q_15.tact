contract DefaultsTest {
    counter: Int = 5;
    flag: Bool = true;
    owner: Address;

    init() {
        self.owner = myAddress();
    }
}