struct WithDefaults {
    x: Int = 10;
    y: Bool = true;
    z: Address;
}

contract TestContract {
    wd: WithDefaults;
    init() {
        self.wd = WithDefaults{
            z: myAddress(),
        };
    }
}