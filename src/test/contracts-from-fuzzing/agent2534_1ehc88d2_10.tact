struct Defaulted {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;
}

contract StructWithDefaults {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}