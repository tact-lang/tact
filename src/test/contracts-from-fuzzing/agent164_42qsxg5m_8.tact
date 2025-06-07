struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "tact";
    d: Address;
}

contract DefTest {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{
            d: myAddress()
        };
    }
}