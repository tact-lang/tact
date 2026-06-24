struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract D {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{
            d: myAddress()
        };
    }
}