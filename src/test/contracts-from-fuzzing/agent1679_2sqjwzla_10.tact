struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Address; // no default
}

contract DefaultsTest {
    data: Defaulted;

    init() {
        self.data = Defaulted{
            d: myAddress()
        };
    }
}