struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
    d: Address;
}

contract DefaultsTest {
    state: DefaultVals;

    init() {
        self.state = DefaultVals{
            d: myAddress()
        };
    }
}