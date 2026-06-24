struct Defaults {
    i: Int = 5;
    b: Bool = true;
    a: Address;
}

contract Test {
    d: Defaults;

    init() {
        self.d = Defaults{ a: myAddress() };
    }
}