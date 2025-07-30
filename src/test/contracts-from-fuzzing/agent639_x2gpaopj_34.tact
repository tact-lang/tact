struct WithManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
}

contract ManyDefaults {
    m: WithManyDefaults;
    init() {
        self.m = WithManyDefaults{};
    }
}