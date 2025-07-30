struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
}

struct Outer {
    inner: NestedDefaults;
    d: Int;
}

contract Test15 {
    data: Outer;
    init() {
        self.data = Outer{inner: NestedDefaults{}, d:5};
    }
}