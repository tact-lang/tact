struct MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Address;
}

contract DefAndNodef {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{ b:true, d:myAddress() };
    }
}