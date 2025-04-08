struct DefNested {
    a: Int = 10;
    b: Bool = false;
    c: Address;
}

contract TestContract {
    nested: DefNested;

    init() {
        self.nested = DefNested{
            c: myAddress()
        };
    }
}