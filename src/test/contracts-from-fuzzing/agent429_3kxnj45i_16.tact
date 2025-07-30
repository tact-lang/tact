struct ManyDefaults {
    a: Int = 1;
    b: String = "b";
    c: Bool = false;
    d: Int?;
    e: Slice?;
    f: Cell?;
}

contract DefaultsStructTest {
    d: ManyDefaults;
    init() {
        self.d = ManyDefaults{};
    }
}
