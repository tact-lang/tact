struct NestedWithManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int = 3;
    d: Bool = true;
    e: Int = 5;
    f: Bool = false;
    g: Int = 7;
    h: Bool = true;
    i: String = "hello";
    j: String = "world";
}

contract NestedDefaults {
    data: NestedWithManyDefaults;

    init() {
        self.data = NestedWithManyDefaults{};
    }
}