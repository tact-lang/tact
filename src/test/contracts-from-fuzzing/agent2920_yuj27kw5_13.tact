struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract DefaultsInit {
    f: WithDefaults;

    init() {
        self.f = WithDefaults{
            d: myAddress()
        };
    }
}