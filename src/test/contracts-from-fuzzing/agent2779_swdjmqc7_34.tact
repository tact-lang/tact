struct ManyOptionDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String = "x";
    d: String? = null;
    e: Bool = true;
    f: Int = 42;
    g: Address? = null;
    h: Cell? = null;
    i: Slice? = null;
}

contract BigOptDefaultMix {
    val: ManyOptionDefaults;
    init() {
        self.val = ManyOptionDefaults{};
    }
}