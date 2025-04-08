struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Address;
}

contract UseDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults {
            d: myAddress()
        };
    }
}