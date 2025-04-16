struct DefaultValTest {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";
    d: Address; // will be set
}

contract TestContract {
    data: DefaultValTest;

    init() {
        self.data = DefaultValTest{
            d: myAddress()
        };
    }
}