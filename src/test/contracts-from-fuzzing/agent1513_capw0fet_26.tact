struct MixedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Address;
}

contract StructWithDefaults {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{
            d: myAddress()
        };
    }
}