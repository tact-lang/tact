struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
    d: Int?; // defaults to null
}

struct ComplexDefaults {
    inner: Defaults = Defaults{};
    optInner: Defaults? = null;
    flag: Bool = true;
    num: Int = 42;
}

contract Test11 {
    val: ComplexDefaults;

    init() {
        self.val = ComplexDefaults{};
    }
}