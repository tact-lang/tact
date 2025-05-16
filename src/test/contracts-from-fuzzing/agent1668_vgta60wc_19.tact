struct InlineDefaults {
    a: Int;
    b: Int = 42;
    c: Bool = true;
    d: String = "foo";
    e: Address;
}

contract TestContract {
    val: InlineDefaults;
    init() {
        self.val = InlineDefaults{
            a: 1,
            e: myAddress()
        };
    }
}
