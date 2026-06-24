struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    s: String = "str";
    addr: Address;
    optI: Int?;
}

contract Test {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            addr: myAddress(),
            optI: null
        };
    }
}