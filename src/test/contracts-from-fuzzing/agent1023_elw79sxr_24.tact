struct StructDefaultsOptional {
    a: Int = 1;
    b: Bool? = null;
    c: String = "hello";
    d: String? = null;
}

contract OptionalDefaultsContract {
    s: StructDefaultsOptional;

    init() {
        self.s = StructDefaultsOptional{};
    }
}