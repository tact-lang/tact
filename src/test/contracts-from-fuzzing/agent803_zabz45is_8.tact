struct WithDefaults {
    f1: Int = 7;
    f2: Bool = true;
    f3: String = "hello";
    f4: Address;
}

contract DefaultsNested {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            f4: myAddress()
        };
    }
}