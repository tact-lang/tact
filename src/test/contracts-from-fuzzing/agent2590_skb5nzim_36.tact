struct BoolDefaultsWithOpt {
    a: Bool = true;
    b: Bool? = null;
    c: Bool = false;
    d: Bool? = null;
}

contract BoolDefaultsOptContract {
    foo: BoolDefaultsWithOpt;
    init() {
        self.foo = BoolDefaultsWithOpt{};
    }
}