struct DefaultsInner {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

contract NestedStructDefaultsFixed {
    s: DefaultsInner;

    init() {
        self.s = DefaultsInner{ };
    }
}
