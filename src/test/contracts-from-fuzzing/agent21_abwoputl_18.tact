struct MixInit {
    a: Int?;
    b: Int = 42;
    c: Bool?;
    d: Bool = true;
}

contract OptAndDefaults {
    val: MixInit;

    init() {
        self.val = MixInit{};
    }
}
