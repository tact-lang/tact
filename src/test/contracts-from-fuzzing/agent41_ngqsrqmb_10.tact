struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
    d: Address;
}

contract DefaultValues {
    state: WithDefaults;
    init() {
        self.state = WithDefaults{
            a: 10,
            b: false,
            c: "xyz",
            d: myAddress(),
        };
    }
}