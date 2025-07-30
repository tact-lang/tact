struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract TestContract {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{
            d: myAddress()
        };
    }
}