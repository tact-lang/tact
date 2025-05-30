struct Inner {
    x: Int? = null;
    y: Bool? = true;
}

struct Outer {
    val: Inner = Inner{};
    z: Int? = null;
}

contract OptionalDefaults {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}