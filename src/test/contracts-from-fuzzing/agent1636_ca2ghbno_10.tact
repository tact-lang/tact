struct HasDefaults {
    flag: Bool = false;
    num: Int = 42;
    text: String = "hi";
    addr: Address;
}

contract TestContract {
    field: HasDefaults;

    init() {
        self.field = HasDefaults{
            addr: myAddress()
        };
    }
}