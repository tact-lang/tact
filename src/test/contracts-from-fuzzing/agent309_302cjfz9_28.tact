struct MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "s";
    d: Address;
}

contract PartialDefaults {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{ b:true, d:myAddress() };
    }
}