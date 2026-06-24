struct CompoundDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "str";
    d: Address;
}

contract CompoundDefaultsContract {
    val: CompoundDefaults;

    init() {
        self.val = CompoundDefaults{
            d: myAddress(),
        };
    }

    receive() {}
}
