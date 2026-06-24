struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Address;
}

contract DefaultsTest {
    data: Defaulted;

    init() {
        self.data = Defaulted{
            a: 42,
            b: false,
            c: "world",
            d: myAddress()
        };
    }
}