struct DefaultsAndSet {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Address;
}

contract DefaultsTest {
    data: DefaultsAndSet;

    init() {
        self.data = DefaultsAndSet{
            a: 7,
            b: true,
            c: "changed",
            d: myAddress()
        };
    }
}
