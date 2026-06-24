struct Defaulted {
    a: Int = 7;
    b: Bool = false;
    c: String = "hi";
}

contract StructWithDefaults {
    foo: Defaulted;

    init() {
        self.foo = Defaulted{}; // uses defaults
    }
}