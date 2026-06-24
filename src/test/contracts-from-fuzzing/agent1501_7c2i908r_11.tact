struct DefaultsTest {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Address;
}

contract TestContract {
    s: DefaultsTest;

    init() {
        self.s = DefaultsTest{
            d: myAddress()
        };
    }
}