struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
    d: Address;
}

contract TestContract {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{
            d: myAddress(),
        };
    }
}
