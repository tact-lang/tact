struct DefaultVals {
    a: Int = 5;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "abc";
    f: String? = null;
}

contract StructDefaults {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{}; // Use solely defaults
    }
}