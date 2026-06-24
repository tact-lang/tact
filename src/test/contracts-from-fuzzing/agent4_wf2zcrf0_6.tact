struct Defaults {
    count: Int = 99;
    flag: Bool = true;
    owner: Address;
}

contract DefaultsTest {
    data: Defaults;

    init() {
        self.data = Defaults{ owner: myAddress() };
    }
}