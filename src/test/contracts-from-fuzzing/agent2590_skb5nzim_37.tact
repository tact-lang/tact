struct IntDefaultsWithOpt {
    a: Int = 1;
    b: Int? = null;
    c: Int = 2;
    d: Int? = null;
}

contract IntDefaultsOptContract {
    foo: IntDefaultsWithOpt;
    init() {
        self.foo = IntDefaultsWithOpt{};
    }
}