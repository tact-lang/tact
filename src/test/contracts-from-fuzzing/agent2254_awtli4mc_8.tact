struct HasDefaults {
    x: Int = 42;
    y: Bool = false;
    z: Address;
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            z: myAddress()
        };
    }
}