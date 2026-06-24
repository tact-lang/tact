struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract Defaults {
    st: Defaulted;

    init() {
        self.st = Defaulted{
            d: myAddress()
        };
    }
}
