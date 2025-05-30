struct MixedDefaults {
    a: Int = 35;
    b: String;
    c: Bool = true;
    d: Address;
    e: Slice;
}

contract DefaultsTest {
    val: MixedDefaults;
    init() {
        self.val = MixedDefaults{
            b: "abc",
            d: myAddress(),
            e: emptyCell().asSlice()
        };
    }
}