struct DefaultsMix {
    a: Int = 1;
    b: Bool = true;
    c: Address; // no default
    d: String = "abc";
}

contract Test {
    data: DefaultsMix;

    init() {
        self.data = DefaultsMix{
            c: myAddress()
        };
    }
}