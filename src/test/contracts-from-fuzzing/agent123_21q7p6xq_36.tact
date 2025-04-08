struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Outer {
    inner: DeepDefaults;
}

contract TestNestedDefaults {
    x: Outer;

    init() {
        self.x = Outer{ inner: DeepDefaults{} };
    }
}