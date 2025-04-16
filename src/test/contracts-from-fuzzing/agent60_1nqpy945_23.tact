struct WithDefaults {
    x: Int = 123;
    y: Bool = true;
    z: Address;
}

contract TestContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{
            z: myAddress()
        };
    }
}