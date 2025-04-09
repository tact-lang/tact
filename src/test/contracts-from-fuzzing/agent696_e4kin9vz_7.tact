struct NestingWithDefaults {
    inner: Inner;
}

struct Inner {
    x: Int = 5;
    y: Bool = false;
    z: String = "hi";
}

contract DefaultsNestTest {
    state: NestingWithDefaults;

    init() {
        self.state = NestingWithDefaults{inner: Inner{}};
    }
}