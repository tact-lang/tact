struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Address;
}

contract DefaultsAndInit {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{ d: myAddress() };
    }
}
