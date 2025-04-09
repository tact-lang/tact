struct MultipleInnerDefaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "str";
}

struct Container {
    inner: MultipleInnerDefaults;
}

contract NestedDefaults {
    f: Container;

    init() {
        self.f = Container{ inner: MultipleInnerDefaults{} };
    }
}