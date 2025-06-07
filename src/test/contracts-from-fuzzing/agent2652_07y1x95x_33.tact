struct EmptyDefaults {
    foo: String = "";
    bar: Int = 0;
    baz: Bool = false;
}

contract DefaultsEdge {
    s: EmptyDefaults;

    init() {
        self.s = EmptyDefaults{};
    }
}