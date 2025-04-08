struct MixDefaults {
    a: Int = 99;
    b: String;
    c: Bool = false;
    d: Address;
}

contract PartialDefaults {
    val: MixDefaults;

    init() {
        self.val = MixDefaults{ b: "hi", d: myAddress() };
    }
}